class CreateCardUsers < ActiveRecord::Migration
  def change
    create_table :card_users do |t|
      t.string :user_id
      t.string :card_id
      t.decimal :desired_sell_price
      t.decimal :desired_buy_price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
