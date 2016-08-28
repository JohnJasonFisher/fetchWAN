class Price < ActiveRecord::Migration
  def change
    add_column :cards, :price, :decimal, precision: 6, scale: 2
  end
end
