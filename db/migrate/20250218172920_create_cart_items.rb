class CreateCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :product_quantity
      t.float :product_discount_total
      t.float :product_total_price

      t.timestamps
    end
  end
end
