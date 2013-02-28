# -*- coding: utf-8 -*-
class Order < ActiveRecord::Base
  belongs_to :user

  STATES = %[ pending in_delivery finished cancelled ]
  SHORT_DISTANCE = "0-6"
  LONG_DISTANCE = "6-8"
  PRICE_LOW_LIMIT_SWITCH = 23.0
  PRICE_HIGH_LIMIT_SWITCH = 30.0
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

  attr_accessible :state, :total_price, :user_id, :name, :last_name, :city, :zip_code, :street, :phone, :home_number, :distance, :products_price, :delivery_cost, :total_price

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

    # jeżeli nie będzie ceny dowozu to funkcja mogłaby
    # zwracać tylko true / false?
    # np. @order.free_delivery? zamiast calculate_delivery_cost...

    def calculate_delivery_cost(price, distance)
      if ((distance == SHORT_DISTANCE and price > PRICE_LOW_LIMIT_SWITCH) or (distance == LONG_DISTANCE and price > PRICE_HIGH_LIMIT_SWITCH))
        FREE_DELIVERY           # true
      else
        COLLECTION_IN_PERSON    # false
      end
    end

    def fixed_new(params, cart)
      products_price = cart.price
      distance = params[:distance]
      delivery_cost = calculate_delivery_cost(products_price, distance)
      total_price = products_price + delivery_cost
      params = params.merge({:products_price => products_price,
                              :delivery_cost => delivery_cost,
                              :total_price => total_price})
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
    "%.2f" % self.total_price
  end

  def uniq_and_sorted_variants
    variants_uniq = self.variants.uniq
    variants_uniq.sort_by! { |variant| variant.product.id }
  end

end
