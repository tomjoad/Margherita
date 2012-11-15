class Product < ActiveRecord::Base
  has_many :variants
  belongs_to :category

  accepts_nested_attributes_for :variants,
  :allow_destroy => true,
  # :reject_if => :all_blank,
  :reject_if => proc { |attributes| attributes['price'].blank? }
  # :limit => 3

  SIZES = ["small", "medium", "big"]

  validates :name, :presence => true
  validates_presence_of :fixed_number

end
