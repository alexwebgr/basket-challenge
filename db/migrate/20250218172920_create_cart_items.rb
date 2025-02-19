class CreateCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :product_quantity
      t.decimal :product_discount_total, precision: 10, scale: 2
      t.decimal :product_total_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
