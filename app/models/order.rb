# -*- coding: utf-8 -*-
class Order < ActiveRecord::Base
  belongs_to :user

  STATES = %[ pending in_delivery finished cancelled ]
  NO_DISTANCE = 'Collection in person'
  SHORT_DISTANCE = 'Free up to 6km'
  LONG_DISTANCE = 'Free up to 9km'
  PRICE_LOW_LIMIT_SWITCH = 23.0
  PRICE_HIGH_LIMIT_SWITCH = 30.0
  DELIVERY_COST = 6.0
  FREE_DELIVERY = 0.0
  COLLECTION_IN_PERSON = 1.0

  validates :cart, :presence => true
  validates :state, :presence => true
  validates :user, :presence => true
  validates :last_name, :presence => true
  validates :city, :presence => true
  validates :street, :presence => true
  validates :phone, :presence => true
  validates :home_number, :presence => true
  validates :distance, :presence => true
  # validate :products_cost_must_be_more_than_high_switch_if_delivery_true

  attr_accessible :state, :total_price,
  :user_id, :name, :last_name, :city,
  :zip_code, :street, :phone, :home_number,
  :distance, :products_price, :delivery, :total_price

  serialize :cart

  scope :for_account, where(:state => [:in_delivery, :pending])
  scope :history, where(:state => [:finished, :cancelled])
  scope :pending, where(:state => [:pending])
  scope :finished, where(:state => 'finished')
  scope :in_delivery, where(:state => 'in_delivery')
  scope :delivered, where(:state => 'delivered')
  scope :cancelled, where(:state => 'cancelled')

  state_machine :state, :initial => :pending do
    event :accept do
      transition :pending => :in_delivery
    end

    event :cancel do
      transition any => :cancelled
    end

    event :finish do
      transition :in_delivery => :finished
    end

    event :restore do
      transition :cancelled => :pending
    end
  end

  class << self

    def possible_distances(total_price)
      if total_price < PRICE_LOW_LIMIT_SWITCH
        [NO_DISTANCE]
      elsif total_price > PRICE_HIGH_LIMIT_SWITCH
        [NO_DISTANCE, LONG_DISTANCE]
      else
        [NO_DISTANCE, SHORT_DISTANCE]
      end
    end

    def all_distances
      [NO_DISTANCE, SHORT_DISTANCE, LONG_DISTANCE]
    end

    def delivery?(price, distance)
      if ((distance == SHORT_DISTANCE and price > PRICE_LOW_LIMIT_SWITCH) or (distance == LONG_DISTANCE and price > PRICE_HIGH_LIMIT_SWITCH))
        true
      else
        false
      end
    end

    def fixed_new(params, cart)
      products_price = cart.price
      distance = params[:distance]
      delivery = delivery?(products_price, distance)
      params = params.merge({:products_price => products_price,
                              :delivery => delivery})
      Order.new(params)
    end

    def for_particular_users(user, params)
      if (user.role == 'admin') || (user.role == 'seller')
        Order.send params
      else
        user.orders.send params
      end
    end

  end

  def products_cost_must_be_more_than_high_switch_if_delivery_true
    unless ( products_price > PRICE_HIGH_LIMIT_SWITCH ) && delivery
      errors.add(:delivery, 'Should be "at the spot" or products price more than "#{PRICE_HIGH_LIMIT_SWITCH}"')
    end
  end

  def free_delivery?
    self.delivery_cost == FREE_DELIVERY
  end

  def no_delivery?
    self.distance == NO_DISTANCE
  end

  def free_delivery_with_distance?
    self.free_delivery? && !self.no_delivery?
  end

  def variants
    variants = []
    self.cart.each do |variant_id|
      variants << Variant.find(variant_id)
    end
    variants.sort_by! { |variant| variant.category.id }
  end

  def categories
    categories = []
    self.variants.each do |variant|
      categories << variant.category.name
    end
    categories.uniq
  end

  def variant_total_price(variant)
    "%.2f" % (variant.price * self.variants.count(variant))
  end

  def formated_total_price
    "%.2f" % self.products_price
  end

  def uniq_and_sorted_variants
    variants_uniq = self.variants.uniq
    variants_uniq.sort_by! { |variant| variant.product.id }
  end

end
