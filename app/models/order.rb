class Order < ActiveRecord::Base
  belongs_to :user

  STATES = %[ pending in_delivery finished cancelled ]
  SHORT_DISTANCE = "0-6"
  LONG_DISTANCE = "6-8"
  PRICE_LIMIT_SWITCH = 23.0
  LOWER_DELIVERY_COST = 5.0
  HIGHER_DELIVERY_COST = 10.0

  ### validates :cart, :presence => true
  # validates :state, :presence => true
  # validates :user_id, :presence => true
  # # ??? why isn`t working!?
  # # validates :user and validates :user_id isn`t the same!
  # # how it works?
  # validates :last_name, :presence => true
  # validates :city, :presence => true
  # validates :street, :presence => true
  # validates :phone, :presence => true
  # validates :home_number, :presence => true
  # validates :distance, :presence => true

  attr_accessible :state, :total_price, :user_id, :name, :last_name, :city, :zip_code, :street, :phone, :home_number, :distance

  serialize :cart

  scope :for_account, where(:state => [:in_delivery, :pending])
  scope :history, where(:state => [:finished, :cancelled])
  # should be in more
  scope :pending, where(:state => [:pending])
  # scope :cancelled, where(:state => [:cancelled])
  scope :finished, where(:state => 'finished')
  scope :in_delivery, where(:state => 'in_delivery')
  scope :delivered, where(:state => 'delivered')
  scope :cancelled, where(:state => 'cancelled')

  def self.for_customer(current_user, history)
    if history == 'true'
      orders = current_user.orders.history
    else
      orders = current_user.orders.for_account
    end
  end

  # Previous version of for_seller:
  # orders = case filter
  # when 'pending' then Order.pending
  # when 'cancelled' then Order.cancelled
  # when 'in_delivery' then Order.in_delivery
  # when 'finished' then Order.finished
  # else Order.all
  # end
  # Now it`s shorter this way, but probably should
  # handle NoMethoError.

  def self.for_seller(filter)
    begin
      return Order.send filter.to_sym
    rescue NoMethodError
      return Order.all
    end
  end

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

  def calculate_delivery_cost
    if self.distance == SHORT_DISTANCE
      if self.products_price <= PRICE_LIMIT_SWITCH
        self.delivery_cost = LOWER_DELIVERY_COST
      end
    elsif self.distance == LONG_DISTANCE
      if self.products_price <= PRICE_LIMIT_SWITCH
        self.delivery_cost = HIGHER_DELIVERY_COST
      else
        self.delivery_cost = LOWER_DELIVERY_COST
      end
    else
    end
  end

end
