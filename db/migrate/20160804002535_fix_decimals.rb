class FixDecimals < ActiveRecord::Migration
  def change
    change_column :card_users, :desired_sell_price, :decimal, precision:8, scale:2
    change_column :card_users, :desired_buy_price, :decimal, precision:8, scale:2
  end
end
