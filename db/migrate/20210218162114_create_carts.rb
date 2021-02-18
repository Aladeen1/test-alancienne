class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.boolean :checked_out

      t.timestamps
    end
  end
end
