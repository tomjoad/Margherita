class Product < ActiveRecord::Base
  has_many :variants
  belongs_to :category

  accepts_nested_attributes_for :variants,
  :allow_destroy => true,
  :reject_if => :all_blank

  validates :name, :presence => true
#  validates :price, :presence => true

end
