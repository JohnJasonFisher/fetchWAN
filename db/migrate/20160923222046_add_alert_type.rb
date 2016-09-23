class AddAlertType < ActiveRecord::Migration
  def change
    add_column :alerts, :type, :string
  end
end
