# -*- coding: utf-8 -*-
class Category < ActiveRecord::Base
  has_many :variants, :through => :products
  has_many :products

  validates :name, :presence => true

  def self.manual_order
    [ 'Pizza', 'Zestawy Obiadowe', 'Spaghetti', 'Naleśniki', 'Fast Food', 'Sałatki', 'Zupy', 'Sosy', 'Napoje i soki' ]
  end

end
