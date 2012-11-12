class Category < ActiveRecord::Base
  has_many :variants, :through => :products
  has_many :products

  validates :name, :presence => true

end
