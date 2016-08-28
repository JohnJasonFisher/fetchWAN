class AddMultiverseId2cardUsers < ActiveRecord::Migration
  def change
    add_column :card_users, :multiverse_id, :integer
  end
end
