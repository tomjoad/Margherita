class AddPromoToVariant < ActiveRecord::Migration
  def change
    add_column :variants, :promo, :boolean
  end
end
