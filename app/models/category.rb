# -*- coding: utf-8 -*-
class Category < ActiveRecord::Base
  has_many :variants, :through => :products
  has_many :products

  validates :name, :presence => true

  def self.manual_order         # HAS TO BE DONE SOME OTHER WAY. THIS IS UGLY.
    [ 'Pizza', 'Zestawy Obiadowe', 'Spaghetti', 'Naleśniki', 'Fast Food', 'Sałatki', 'Zupy', 'Sosy', 'Napoje i soki' ]
  end

  def generate_fixed_number
    self.fixed_numbers.sort.last + 1
  end

  def fixed_numbers
    arr = []
    self.products.each do |product|
      arr << product.fixed_number.to_i
    end
    arr
  end

  def anchor_name
    self.name.downcase.delete(' ')
  end

end
