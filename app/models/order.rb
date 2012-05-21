class Order < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :cart, :state, :total_price, :user_id

  validates :address, :presence => true
  validates :cart, :presence => true
  validates :state, :presence => true
  validates :total_price, :presence => true
  validates :user, :presence => true

end
