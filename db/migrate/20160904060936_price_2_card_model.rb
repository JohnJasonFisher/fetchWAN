class Price2CardModel < ActiveRecord::Migration
  def change
    add_column :cards, :current_price, :decimal, precision: 7, scale: 2
  end
end
