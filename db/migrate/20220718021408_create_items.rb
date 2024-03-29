class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :burden_of_shipping_charges_id, null: false
      t.integer :ken_name_id, null: false
      t.integer :days_to_ship_id, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false, default: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end


end
