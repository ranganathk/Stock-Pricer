class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :name, :null => false
      t.float :price, :null => false
      t.integer :maturity, :null => false
      t.boolean :call_option, :default => false
      t.boolean :put_option, :default => false

      t.timestamps
    end
  end
end
