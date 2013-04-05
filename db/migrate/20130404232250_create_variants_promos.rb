class CreateVariantsPromos < ActiveRecord::Migration
  def change
    create_table :variants_promos do |t|
      t.integer :variant_id
      t.integer :promo_id

      t.timestamps
    end
  end
end
