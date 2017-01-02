class NameAdded2CarduserDatabase < ActiveRecord::Migration
  def change
    add_column :card_users, :card_name, :string
  end
end
