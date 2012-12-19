class Product < ActiveRecord::Base
  has_many :variants
  belongs_to :category

  accepts_nested_attributes_for :variants,
  :allow_destroy => true,
  # :reject_if => :all_blank,
  :reject_if => proc { |attributes| attributes['price'].blank? }
  # :limit => 3

  SIZES = %w[small medium big]

  validates :name, :presence => true
  validates_presence_of :fixed_number

  def sizes
    arr = []
    self.variants.each do |variant|
      arr.push(variant.size)
    end
    arr
  end

end
