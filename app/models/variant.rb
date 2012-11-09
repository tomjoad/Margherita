class Variant < ActiveRecord::Base
  belongs_to :product
  attr_accessible :price, :size
end
