class AddPromoToVariant < ActiveRecord::Migration
  def change
    add_column :variants, :promo, :bool
  end
end
