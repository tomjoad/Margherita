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

  belongs_to :category

  validates :name, :presence => true
  validates :price, :presence => true

end
