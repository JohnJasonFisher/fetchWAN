class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :card_id

      t.timestamps null: false
    end
  end
end
