class AddNewColumnToIndicator < ActiveRecord::Migration[7.0]
  def change
    add_column :indicators, :attributes, :jsonb, default: {}, null: false
  end
end
