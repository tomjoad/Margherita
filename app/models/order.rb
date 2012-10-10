class Order < ActiveRecord::Base
  belongs_to :user

  STATES = %[ pending in_delivery finished cancelled ]
  SHORT_DISTANCE = "0-6"
  LONG_DISTANCE = "6-8"
  PRICE_LIMIT_SWITCH = 23.0
  LOWER_DELIVERY_COST = 5.0
  HIGHER_DELIVERY_COST = 10.0

  validates :cart, :presence => true
  validates :state, :presence => true
  validates :user, :presence => true
  validates :last_name, :presence => true
  validates :city, :presence => true
  validates :street, :presence => true
  validates :phone, :presence => true
  validates :home_number, :presence => true
  validates :distance, :presence => true
  # validates :products_price, :presence => true
  # validates :delivery_cost, :presence => true
  # validates :total_price, :presence => true
  # validates :address, :presence => true

  attr_accessible :state, :total_price, :user_id, :name, :last_name, :city, :zip_code, :street, :phone, :home_number, :distance

  serialize :cart

  # after_validation(:on => :create) do
  #   self.total_price = self.delivery_cost + self.products_price
  # end

  scope :for_user_account, where(:state => [:in_delivery, :pending])
  scope :for_user_history, where(:state => [:finished, :cancelled])

  # scope :finished, where(:state => 'finished')
  # scope :in_deliver, where(:state => 'in_delivery')
  # scope :delivered, where(:state => 'delivered')
  # scope :cancelled, where(:state => 'cancelled')

  state_machine :state, :initial => :pending do

    event :accept do
      transition :pending => :in_delivery
    end

    event :cancel do
      transition any => :cancelled
    end

    event :delivered do
      transition :in_delivery => :finished
    end

    event :restore do
      transition :cancelled => :pending
    end
  end

  def check
    self.distance
  end

  # values have to be chanched into constants definitions

  def calculate_delivery_cost
    if self.distance == SHORT_DISTANCE
      if self.products_price <= PRICE_LIMIT_SWITCH
        self.delivery_cost = LOWER_DELIVERY_COST
      end
    elsif self.distance == LONG_DISTANCE
      if self.products_price <= PRICE_LIMIT_SWITCH
        self.delivery_cost = HOGHER_DELIVERY_COST
      else
        self.delivery_cost = LOWER_DELIVERY_COST
      end
    else
    end
  end


  # private

  # def calculate_total_price
  #   if distance == "0-6"
  #     if total_price <= 23
  #       total_price += 5.0
  #     end
  #   elsif distance == "6-8"
  #     if total_price <= 23
  #       total_price += 10
  #     else
  #       total_price += 5
  #     end
  #   else
  #   end
  # end

end
