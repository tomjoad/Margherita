class Order < ActiveRecord::Base
  belongs_to :user

  STATES = %[ pending in_delivery finished cancelled ]

  # validates :address, :presence => true
  validates :cart, :presence => true
  validates :state, :presence => true
  validates :total_price, :presence => true
  validates :user, :presence => true
  validates :last_name, :presence => true
  validates :city, :presence => true
  validates :street, :presence => true
  validates :phone, :presence => true
  validates :home_number, :presence => true
  validates :distance, :presence => true

  attr_accessible :state, :total_price, :user_id, :name, :last_name, :city, :zip_code, :street, :phone, :home_number, :distance

  serialize :cart

  scope :for_user_account, where(:state => [:in_delivery, :pending])
  scope :for_user_history, where(:state => [:finished, :cancelled])

  scope :finished, where(:state => 'finished')
  scope :in_deliver, where(:state => 'in_delivery')
  scope :delivered, where(:state => 'delivered')
  scope :cancelled, where(:state => 'cancelled')

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

end
