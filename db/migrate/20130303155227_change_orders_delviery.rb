class ChangeOrdersDelviery < ActiveRecord::Migration
  change_table :orders do |t|
    t.rename :delviery, :delivery
  end
end
