class AddPromoToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :promo, :boolean
  end
end
