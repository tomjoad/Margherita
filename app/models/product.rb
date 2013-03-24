class Product < ActiveRecord::Base
  has_many :variants
  belongs_to :category

  # attr_accessible :variants_attributes, :fixed_number, :category_id, :name, :description
  accepts_nested_attributes_for :variants,
  :allow_destroy => true,
  # :reject_if => proc { |attributes| attributes['price'].blank? }
  # :limit => 3
  :reject_if => :price_is_blank

  SIZES = %w[small medium big]

  validates :name, :presence => true
  validates :fixed_number, :presence => true
  validate :fixed_number_unique_in_category

  def fixed_number_unique_in_category
    if self.category.fixed_numbers.include?(fixed_number.to_i)
      errors.add(:fixed_number, "fixed number isn`t unique in this category")
    end
  end

  def sizes
    arr = []
    self.variants.each do |variant|
      arr.push(variant.size)
    end
    arr
  end

  def price_is_blank(attributed)
    if !(attributed['id'].nil?)
      return true
    else
      attributed['price'].blank?
    end
  end

end
