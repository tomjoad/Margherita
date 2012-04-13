class Product < ActiveRecord::Base

  validates :name, :presence => true
  validates :price, :presence => true

  def price_in_dolars
   read_attribute(:price) + 12.0
  end

end
