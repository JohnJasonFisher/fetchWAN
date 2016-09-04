class CardName < ActiveRecord::Migration
  def change
    rename_column :cards, :card_name, :name
  end
end
