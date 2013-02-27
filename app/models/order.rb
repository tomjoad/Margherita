class Order < ActiveRecord::Base
  belongs_to :user

  STATES = %[ pending in_delivery finished cancelled ]
  SHORT_DISTANCE = "0-6"
  LONG_DISTANCE = "6-8"
  PRICE_LIMIT_SWITCH = 23.0
  LOWER_DELIVERY_COST = 5.0
  HIGHER_DELIVERY_COST = 10.0
  MINIMUM_DELIVERY_COST = 0.0

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

    def calculate_delivery_cost(price, distance)
      if distance == SHORT_DISTANCE
        if price <= PRICE_LIMIT_SWITCH
          LOWER_DELIVERY_COST
        else
          MINIMUM_DELIVERY_COST
        end
      elsif distance == LONG_DISTANCE
        if price <= PRICE_LIMIT_SWITCH
          HIGHER_DELIVERY_COST
        else
          LOWER_DELIVERY_COST
        end
      else
      end
    end

    def fixed_new(params, cart)
      products_price = cart.price
      distance = params[:distance]
      delivery_cost = Order.calculate_delivery_cost(products_price, distance)
      total_price = products_price + delivery_cost
      params = params.merge({:products_price => products_price,
                              :delivery_cost => delivery_cost,
                              :total_price => total_price})
      Order.new(params)
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
