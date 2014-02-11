class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2, null: false, default: 0
      t.integer :quantity, null: false, default: 0
      t.date :produced_at
      t.references :issue, null: false
      t.timestamps
    end

    add_index :products, :issue_id
    add_index :products, :name, unique: true
  end
end
