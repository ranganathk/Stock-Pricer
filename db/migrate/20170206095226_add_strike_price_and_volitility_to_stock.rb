class AddStrikePriceAndVolitilityToStock < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :strikePrice, :float, :null => false
    add_column :stocks, :colitility, :float, :null => false
    add_column :stocks, :interestRate, :float, :null => false
  end
end
