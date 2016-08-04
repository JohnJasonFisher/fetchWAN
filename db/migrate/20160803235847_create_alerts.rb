class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :user_id
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
