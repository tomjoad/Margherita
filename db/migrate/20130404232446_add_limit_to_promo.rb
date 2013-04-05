class AddLimitToPromo < ActiveRecord::Migration
  def change
    add_column :promos, :limit, :float
  end
end
