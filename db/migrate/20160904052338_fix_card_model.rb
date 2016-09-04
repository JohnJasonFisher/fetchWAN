class FixCardModel < ActiveRecord::Migration
  def change
    remove_column :cards, :ref_time, :date
    remove_column :cards, :price, :decimal
    rename_column :cards, :url, :image_url
  end
end
