class IdString2Numbers < ActiveRecord::Migration
  def change
    change_column :alerts, :user_id, "numeric USING CAST(user_id AS numeric)"
    change_column :alerts, :user_id, :integer
    change_column :card_users, :user_id, "numeric USING CAST(user_id AS numeric)"
    change_column :card_users, :user_id, :integer
    change_column :card_users, :card_id, "numeric USING CAST(card_id AS numeric)"
    change_column :card_users, :card_id, :integer
    change_column :cards, :price, :decimal, precision: 8, scale: 2
  end
end
