class AddNewColumnToCollection < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :dynamic_attributes, :jsonb, default: {}, null: false
  end
end
