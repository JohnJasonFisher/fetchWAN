class AddSet < ActiveRecord::Migration
  def change
    add_column :cards, :set, :string
  end
end
