# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  price       :float
#  category_id :integer
#

class Product < ActiveRecord::Base
  has_many :variants
  belongs_to :category

  SIZES = ["Three sizes","Two sizes","Just one size"]

  validates :name, :presence => true
  validates :price, :presence => true

end
