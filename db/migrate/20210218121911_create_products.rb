class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price_ht, precision: 10, scale: 2
      t.integer :tva, default: 0
      t.integer :stock_available
      t.integer :stock_ordered

      t.timestamps
    end
  end
end
