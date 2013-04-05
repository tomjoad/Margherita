class DeletePromoFromVariants < ActiveRecord::Migration
  def change
    change_table :variants do |t|
      t.remove :promo
    end
  end

end
