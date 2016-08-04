class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :price
      t.date :ref_time

      t.timestamps null: false
    end
  end
end
