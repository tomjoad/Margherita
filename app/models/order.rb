class Order < ActiveRecord::Base
  belongs_to :user

  STATES = %[ pending in_delivery finished cancelled ]

  validates :address, :presence => true
  validates :cart, :presence => true
  validates :state, :presence => true
  validates :total_price, :presence => true
  validates :user, :presence => true

  attr_accessible :address, :cart, :state, :total_price, :user_id


  state_machine :state, :initial => :pending do

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
