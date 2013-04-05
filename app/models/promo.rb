class Promo < ActiveRecord::Base
  has_and_belongs_to_many :variants

  attr_accessible :name, :limit

end
