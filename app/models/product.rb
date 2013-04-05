class Product < ActiveRecord::Base
  has_many :variants
  belongs_to :category
  # maybe not necessary

  accepts_nested_attributes_for :variants,
  # todo - destroying variants when text_field is empty
  :allow_destroy => true,
  :reject_if => proc { |attributes| attributes['price'].blank? }

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

end
