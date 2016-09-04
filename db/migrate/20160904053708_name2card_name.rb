class Name2cardName < ActiveRecord::Migration
  def change
    rename_column :cards, :name, :card_name
  end
end
