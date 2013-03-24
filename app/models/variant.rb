class Variant < ActiveRecord::Base
  belongs_to :product
  has_one :category, :through => :product

  # attr_accessible :price, :size

  # validates :size, :presence => true
  # validates :price, :presence => true

  delegate :name, :to => :product, :allow_nil => true

  # def price_is_blank?
  #   self.price.blank?
  # end

  def format_category_name
    self.category.name.downcase.delete(' ')
  end

  def formated_price
    '%.2f' % self.price
  end

end
