class AddDefaultValueToCarts < ActiveRecord::Migration[6.0]
  def change
  	change_column :carts, :checked_out, :boolean , default: false
  end
end
