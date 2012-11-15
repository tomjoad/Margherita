class Variant < ActiveRecord::Base
  belongs_to :product
  has_one :category, :through => :product

  attr_accessible :price, :size

  validates_presence_of :size
  validates_presence_of :price

  delegate :name, :to => :product, :allow_nil => true

end
