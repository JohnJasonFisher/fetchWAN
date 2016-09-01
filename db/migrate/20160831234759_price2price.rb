class Price2price < ActiveRecord::Migration
  def change
    add_column :prices, :price, :decimal, precision: 7, scale: 2
  end
end
