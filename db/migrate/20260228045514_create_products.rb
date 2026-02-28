class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.string :category
      t.date :expiration_date
      t.string :brand

      t.timestamps
    end
  end
end
