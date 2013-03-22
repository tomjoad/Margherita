# -*- coding: utf-8 -*-

ARRAY = [
  ["Pizza", [
      ['Margherita', 'klasyczna Margherita bez dodatków', 1, [ [10.5, '24cm'], [13.5, '32cm'] ] ],
      ['Studencka', 'z pieczarkami', 2, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Toska', 'z pieczarkami i szynką', 3, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Hawajska', 'z ananasem i szynką', 4, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Brokułka', 'z brokułami, pomidorem i szynką', 5, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Do-Re-Mi_Salami', 'z salami, pieczarkami i cebulą', 6, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Morska Bryza', 'z tuńczykiem, pomidorem i papryką', 7, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Jajcarska', 'z jajkiem, serem feta, brokułami, kaparami i papryką', 8, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Kowala', 'z boczkiem, papryką, szynką, cebulą i czosnkiem', 9, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Jarska', 'z cebulą, kukurydzą, pomidorem, papryką i brokułami', 10, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Bartolomeo', 'z oliwkami, salami, szynką i kukurydzą', 11, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Kaparina', 'z serami feta i camembert, kaparami, brokułami i papryką', 12, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Cztery sery', 'z serami feta, camembert i gouda oraz papryką', 13, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Pirat Krzyś', 'z kalmarami, ośmiorniczkami, małżami i krewetkami', 14, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Rumcajs', 'z kabanosem, kiełbasą, boczkiem, ogórkiem i cebulą', 15, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Los Kurczakos', 'z kurczakiem, papryką, kukurydzą, cebulą i cebulką konserwową', 16, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Szpinka', 'ze szpinakiem, czosnkiem, szynką i serem feta', 17, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Czochol', 'z podwójnym czosnkiem, kabanosem, boczkiem, pieczarkami i cebulą', 18, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Grecka', 'z pomidorem, oliwkami, serem feta i cebulą', 19, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
      ['Pepperoni', 'z salami oraz pikantnymi papryczkami pepperoni', 19, [ [11.5, '24cm'], [16.0, '32cm'] ] ],
    ]
  ],
  ["Spaghetti", [
      ['gowniane', 'klasyczna bez dodatków', 5, [ [21, 'z cebulą'] ] ],
      ['mniej gowniane', 'z pieczarkami', 6, [ [11.0, 'z majonewzem'] ] ],
      ['w ogole nie gowniane', 'z pieczarkami', 7, [ [32.0, 'z kitem'] ] ]
    ]
  ]
]

calc_arr = []

ARRAY.each do |element|
  m_arr = []
  element[1].each do |member|
    var_arr = []
    member[3].each do |variant|
      var_arr << { :price => variant[0], :size => variant[1] }
    end
    m_arr << { :member => {
        :name => member[0],
        :description => member[1],
        :fixed_number => member[2],
        :variants_attributes => var_arr } }
  end
  calc_arr << { element[0] => m_arr }
end

calc_arr.each do |category|
  name = category.keys.first
  Category.create(:name => name)
  category[name].each do |product|
    Product.create(product[:member]) do |member|
      member.category = Category.find_by_name(name)
    end
  end
end

# CATEGORIES = [
#   { name: "Pizza" },
#   { name: "Spaghetti" },
#   { name: "Fast Food" },
#   { name: "Sałatki" },
#   { name: "Sosy" },
#   { name: "Naleśniki" },
#   { name: "Napoje i soki" },
#   { name: "Zupy" },
#   { name: "Zestawy obiadowe" } ]

# PRODUCTS = [
#   { "Pizza" => [
#       { :member => {
#           :name => 'Margherita',
#           :description => 'klasuczna Margherita bez dodatków',
#           :fixed_number => 1,
#           :variants_attributes => [
#             { :price => 10.5, :size => '24cm' },
#             { :price => 13.5, :size => '32cm' }
#           ]
#         }},
#       { :member => {
#           :name => 'Studencka',
#           :description => 'z pieczarkami',
#           :fixed_number => 2,
#           :variants_attributes => [
#             { :price => 11.5, :size => '24cm' },
#             { :price => 16.0, :size => '32cm' }
#           ]
#         }},
#       { :member => {
#           :name => 'Toska',
#           :description => 'z pieczarkami i szynką',
#           :fixed_number => 3,
#           :variants_attributes => [
#             { :price => 13.5, :size => '24cm' },
#             { :price => 16, :size => '32cm' }
#           ]
#         }}
#     ]
#   },
#   { "Spaghetti" => [
#       { :member => {
#           :name => 'bol',
#           :description => 'z jajkiem',
#           :fixed_number => 189,
#           :variants_attributes => [
#             { :price => 13.5, :size => '' }
#           ]
#         }}
#     ]},

#   { "Fast Food" => [
#     ] },
#   { "Sałatki" => [
#     ] },
#   { "Sosy" => [
#     ] },
#   { "Naleśniki" => [
#     ] },
#   { "Napoje i sosy" => [
#     ] },
#   { "Zupy" => [
#     ] },
#   { "Zestawy obiadowe" => [
#     ] }
# ]


# PIZZA.each do |pizza|
#   Product.create(pizza[:member]) do |product|
#     product.category = Category.find_by_name("Pizza")
#   end
# end

# Product.create(PIZZA) do |product|
#   product.category = Product.find_by_name("Pizza")

# end
