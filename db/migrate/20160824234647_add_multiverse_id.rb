class AddMultiverseId < ActiveRecord::Migration
  def change
    add_column :cards, :multiverse_id, :integer
  end
end
