class RemoveColumnAndAddNewOne < ActiveRecord::Migration[7.0]
  def change
    remove_column :indicators, :attributes
    add_column :indicators, :dynamic_attributes, :jsonb, default: {}, null: false
  end
end
