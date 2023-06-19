class ChangeColumnCollection < ActiveRecord::Migration[7.0]
  def change
    change_column :collections, :date, :date
  end
end
