# -*- coding: utf-8 -*-
CATEGORIES = [
  { name: "Pizza" },
  { name: "Spaghetti" },
  { name: "Fast Food" },
  { name: "Sałatki" },
  { name: "Sosy"},
  { name: "Naleśniki" },
  { name: "Dodatki"},
  { name: "Zupy" },
  { name: "Dania obiadowe" } ]

FAST_FOOD = [
  { name: "Ciabatta", description: "mięso drobiowe, sałatki, cebulka prażona i sosy", :fixed_number => 22 },
  { name: "Hamburger", description: "desc", :fixed_number => 33},
  { name: "Frytki", description: "desc", :fixed_number => 44} ]

FRYTKI_VAR = [
  {:price => 20.0, :size => "małe"},
  {:price => 12.0, :size => "duże"} ]

CIABATA_VAR = [
{:price => 12, :size => "normalna"}]

HAMBURGER_VAR = [
{:price => 4, :size => ""}]

Category.create(CATEGORIES)

# Product.create(:name => "Frytki", :description => "desc", :category => Category.find_by_name("Dodatki"), :fixed_number => 22 )
Product.create(FAST_FOOD) do |product|
  product.category = Category.find_by_name("Fast Food")
end

Variant.create(FRYTKI_VAR) do |variant|
  variant.product = Product.find_by_name("Frytki")
end

Variant.create(CIABATA_VAR) do |variant|
  variant.product = Product.find_by_name("Ciabatta")
end

Variant.create(HAMBURGER_VAR) do |variant|
  variant.product = Product.find_by_name("Hamburger")
end
