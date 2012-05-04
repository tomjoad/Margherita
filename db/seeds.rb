# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Figure out how to do it in YAML, make it look nicer.

CATEGORIES = [
  { name: "Pizza" },
  { name: "Spaghetti" },
  { name: "Fast Food" },
  { name: "Sałatki" },
  { name: "Sosy"},
  { name: "Naleśniki" },
  { name: "Dodatki"},
  { name: "Zupy" },
  { name: "Obiady" } ]

DANIA_OBIADOWE = [
  { name: "Rolada Wołowa", description: "z kluskami śląskimi, czerwoną kapustą i sosem.", price: 20.00 },
  { name: "File z Kurczaka", description: "z frytkami i zestawem surówek", price: 12.00 },
  { name: "Schabowy po Wiedeńsku", description: "z frytkami i zestawem surówek", price: 14.00 },
  { name: "Schabowy po Hawajsku", description: "", price: 16.00 },
  { name: "Golonko Zapiekane", description: "z kapustą zasmażaną i pieczywem", price: 25.00 },
  { name: "Placek po Węgiersku", description: "desc", price: 16.00 },
  { name: "Camembert Zasmażany", description: "z żurawiną, frytkami i zestawem surówek", price: 12.00 },
]

ZUPY = [
  { name: "Rosół z Makaronem", description: "desc", price: 5.00 },
  { name: "Krem z Pieczarek", description: "z grzankami", price: 6.00 },
  { name: "Krem z Groszku Zielonego", description: "z grzankami", price: 5.00 },
  { name: "Cebulowa", description: "z grzankami", price: 5.00 },
  { name: "Flaczki", description: "desc", price: 8.00 },
]

DODATKI = [
#  { name: "Frytki", description: "desc", price: 5.50, price_for_small: 3.50 },
  { name: "Zestaw surówek", description: "desc", price: 5.00 },
  { name: "Buraczki", description: "desc", price: 4.00 },
  { name: "Kapusta pekińska MIX", description: "desc", price: 5.00 },
  { name: "Kapusta czerwona", description: "desc", price: 3.50 },
]

PIZZA = [
  { name: "Margherita", description: "desc", price: 13.50, price_for_small: 10.50 },
  { name: "Studencka", description: "pieczarki", price: 16.00, price_for_small: 11.50 },
  { name: "Toska", description: "pieczarki, szynka", price: 17.50, price_for_small: 13.00 },
  { name: "Hawajska", description: "ananas, szynka", price: 19.50, price_for_small: 13.50 },
  { name: "Brokułka", description: "brokuły, pomidor, szynka", price: 18.50, price_for_small: 13.50 },
  { name: "Do-Re-Mi-Salami", description: "salami, pieczarki, cebula", price: 19.50, price_for_small: 14.50 },
  { name: "Morska Bryza", description: "tuńczyk, pomidor, papryka", price: 20.50, price_for_small: 15.00 },
  { name: "Jajcarska", description: "jajko, ser feta, brokuły, kapary, papryka", price: 20.50, price_for_small: 15.00 },
  { name: "Kowala", description: "boczek, papryka, szynka, cebula, czosnek", price: 20.50, price_for_small: 14.50 },
  { name: "Jarska", description: "cebula, kukurydza, pomidor, papryka, brokuły", price: 19.50, price_for_small: 14.50 },
  { name: "Bartolomeo", description: "oliwki, salami, szynka, kukurydza", price: 20.50, price_for_small: 14.50 },
  { name: "Kaparina", description: "ser feta, camembert, kapary, prokuły, papryka", price: 20.50, price_for_small: 14.50 },
  { name: "Cztery sery", description: "ser feta, camembert, gouda, papryka", price: 19.50, price_for_small: 13.50 },
  { name: "Pirat Krzyś", description: "kalmary, ośmiorniczki, małże, krewetki", price: 20.50, price_for_small: 14.50 },
  { name: "Rumcajs", description: "kabanos, kiełbasa, boczek, ogórek, cebula", price: 20.50, price_for_small: 14.50 },
  { name: "Los Kurczakos", description: "kurczak, papryka, kukurydza, cebula, cebulka kons.", price: 20.50, price_for_small: 14.50 },
  { name: "Szpinka", description: "czosnek, szpinak, szynka, ser feta", price: 19.50, price_for_small: 13.50 },
  { name: "Czochol", description: "kabanos, boczek, pieczarki, cebula, czosnek", price: 20.50, price_for_small: 14.50 },
  { name: "Grecka", description: "pomidor, oliwki, ser feta, cebula", price: 19.50, price_for_small: 13.50 },
  { name: "Pepperoni", description: "salami, pikantne papryczki pepperoni", price: 21.00, price_for_small: 15.00 },

]

SPAGHETTI = [
  { name: "Bolognese", description: "mięso mielone wołowo-wieprzowe, sos bolognese", price: 15.00 },
  { name: "Napoli", description: "bezmięsne, na bazie sosu pomidorowego", price: 12.00 },
  { name: "Carbonara", description: "boczek, gęsty sos carbonara (serowy z czosnkiem i ziołami)", price: 15.00 },
  { name: "Mozzarella", description: "ser mozzarella, oliwki, czosnek", price: 13.00 },
]

SALATKI = [
  { name: "Grecka", description: "sałata, ogórek, pomidor, cebula, ser feta, oliwki, sos", price: 9.00, price_for_small: 5.00 },
  { name: "Z Tuńczykiem", description: "tuńczyk, ser mozzarella, kukurydza, pomidor, czerwona fasola, sałata, sos majonezowo-keczupowy", price: 11.00, price_for_small: 6.00 },
  { name: "Z Kurczakiem", description: "sałata, kurczak, pomidor, cebula, kukurydza, sos majonezowo-keczupowy", price: 11.00, price_for_small: 6.00 },
]

NALESNIKI = [
  { name: "Jarski", description: "warzywa mix", price: 10.00 },
  { name: "Morski", description: "tuńczyk, kukurydza, fasola, ogórek, jajko", price: 12.00 },
  { name: "Naleśnik Kowala", description: "boczek, papryka, cebula, kukurydza, jajko", price: 12.00 },
  { name: "Hawajski", description: "ananas, szynka, kukurydza", price: 12.00 },
  { name: "Meksykański", description: "mięso mielone, sos bolognese, kukurydza, fasola", price: 13.00 },
  { name: "Szpinaczek", description: "szpinak, czosnek", price: 10.00 },
]

FAST_FOOD = [
  { name: "Ciabatta", description: "mięso drobiowe, sałatki, cebulka prażona i sosy", price: 10.00 },
  { name: "Hamburger", description: "desc", price: 5.00 },
  { name: "Cheeseburger", description: "desc", price: 6.00 },
  { name: "Chickeburger", description: "desc", price: 6.00 },
  { name: "Zapiekanka z Pieca", description: "desc", price: 4.00 },
  { name: "Hot-Dog", description: "desc", price: 5.00 },
  { name: "Tortilla", description: "desc", price: 8.00 },
  { name: "Frytki", description: "desc", price: 5.50, price_for_small: 3.50 },
]

SOSY = [
  { name: "Czosnkowy", description: "desc", price: 2.00 },
  { name: "Majonezowy", description: "desc", price: 2.00 },
  { name: "Meksykański", description: "desc", price: 2.00 },
  { name: "Tzatziki", description: "desc", price: 2.00 },
]

Category.create(CATEGORIES)

Product.create(DANIA_OBIADOWE) do |product|
  product.category = Category.find_by_name("Obiady")
end

Product.create(ZUPY) do |product|
  product.category = Category.find_by_name("Zupy")
end

Product.create(DODATKI) do |product|
  product.category = Category.find_by_name("Dodatki")
end

Product.create(PIZZA) do |product|
  product.category = Category.find_by_name("Pizza")
end

Product.create(SPAGHETTI) do |product|
  product.category = Category.find_by_name("Spaghetti")
end

Product.create(SALATKI) do |product|
  product.category = Category.find_by_name("Sałatki")
end

Product.create(NALESNIKI) do |product|
  product.category = Category.find_by_name("Naleśniki")
end

Product.create(SOSY) do |product|
  product.category = Category.find_by_name("Sosy")
end

Product.create(FAST_FOOD) do |product|
  product.category = Category.find_by_name("Fast Food")
end

# categories = Category.create([{ name: "Pizza" }, { name: "Spaghetti" }, { name: "Fast Food" }, { name: "Sałatki" }, { name: "Sosy"}, { name: "Naleśniki" }, { name: "Dodatki"}, { name: "Zupy" }, { name: "Obiady" }])

