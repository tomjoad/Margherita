# -*- coding: utf-8 -*-
CATEGORIES = [
  { name: "Pizza" },
  { name: "Spaghetti" },
  { name: "Fast Food" },
  { name: "Sałatki" },
  { name: "Sosy"},
  { name: "Naleśniki" },
  { name: "Napoje i soki"},
  { name: "Zupy" },
  { name: "Zestawy obiadowe" } ]

PIZZA = [
         { name: "Margherita", description: "klasyczna Margherita bez dodatków", :fixed_number => 1 },
         { name: "Studencka", description: "z pieczarkami", :fixed_number => 2 },
         { name: "Toska", description: "z pieczarkami i szynką", :fixed_number => 3 },
         { name: "Hawajka", description: "z ananasem i szynką", :fixed_number => 4 },
         { name: "Brokułka", description: "z brokułami, pomidorem i szynką", :fixed_number => 5 },
         { name: "Do-Re-Mi-Salami", description: "z salami, pieczarkami i cebulą", :fixed_number => 6 },
         { name: "Morska Bryza", description: "z tuńczykiem, pomidorem i papryką", :fixed_number => 7 },
         { name: "Jajcarska", description: "z jajkiem, serem feta, brokułami, kaparami i papryką", :fixed_number =>8 },
         { name: "Kowala", description: "z boczkiem, papryką, szynką, cebulą i czosnkiem", :fixed_number => 9 },
         { name: "Jarska", description: "z cebulą, kukurydzą, pomidorem, papryką i brokułami", :fixed_number => 10 },
         { name: "Bartolomeo", description: "z oliwkami, salami, szynką i kukurydzą", :fixed_number => 11 },
         { name: "Kaparina", description: "z serami feta i camembert, kaparami, brokułami i papryką", :fixed_number => 12 },
         { name: "Cztery Sery", description: "z serami feta, camembert i gouda oraz papryką", :fixed_number => 13 },
         { name: "Pirat Krzyś", description: "z kalmarami, ośmiorniczkami, małżami i krewetkami", :fixed_number => 14 },
         { name: "Rumcajs", description: "z kabanosem, kiełbasą, boczkiem, ogórkiem i cebulą", :fixed_number => 15 },
         { name: "Los Kurczakos", description: "z kurczakiem, papryką, kukurydzą, cebulą i cebulką konserwową", :fixed_number => 16 },
         { name: "Szpinka", description: "ze szpinakiem, czosnkiem, szynką i serem feta", :fixed_number => 17 },
         { name: "Czochol", description: "z podwójnym czosnkiem, kabanosem, boczkiem, pieczarkami i cebulą", :fixed_number => 18 },
         { name: "Grecka", description: "z pomidorem, oliwkami, serem feta i cebulą", :fixed_number => 19 },
         { name: "Pepperoni", description: "z salami oraz pikantnymi papryczkami pepperoni", :fixed_number => 20 }]

MARGHERITA_VAR = [{ :price => 10.5, :size => "24cm" },
                  { :price => 13.5, :size => "32cm" }]
STUDENCKA_VAR = [{ :price => 11.5, :size => "24cm" },
                 { :price => 16.0, :size => "32cm" }]
TOSKA_VAR = [{ :price => 13.0, :size => "24cm" },
             { :price => 17.5, :size => "32cm" }]
HAWAJKA_VAR = [{ :price => 13.5, :size => "24cm" },
               { :price => 19.5, :size => "32cm" }]
BROKULKA_VAR = [{ :price => 13.5, :size => "24cm" },
                { :price => 18.5, :size => "32cm" }]
DOREMISALAMI_VAR = [{ :price => 14.5, :size => "24cm" },
                    { :price => 19.5, :size => "32cm" }]


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

# PIZZA ---------------------------->
Product.create(PIZZA) do |product|
  product.category = Category.find_by_name("Pizza")
end

Variant.create(MARGHERITA_VAR) do |variant|
  variant.product = Product.find_by_name("Margherita")
end
Variant.create(STUDENCKA_VAR) do |variant|
  variant.product = Product.find_by_name("Studencka")
end
Variant.create(TOSKA_VAR) do |variant|
  variant.product = Product.find_by_name("Toska")
end
Variant.create(HAWAJKA_VAR) do |variant|
  variant.product = Product.find_by_name("Hawajka")
end
Variant.create(BROKULKA_VAR) do |variant|
  variant.product = Product.find_by_name("Brokułka")
end
Variant.create(DOREMISALAMI_VAR) do |variant|
  variant.product = Product.find_by_name("Do-Re-Mi-Salami")
end
# END OF PIZZA---------------------.

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
