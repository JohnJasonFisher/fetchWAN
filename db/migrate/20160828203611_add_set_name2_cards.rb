class AddSetName2Cards < ActiveRecord::Migration
  def change
    add_column :cards, :set_name, :string
  end
end
