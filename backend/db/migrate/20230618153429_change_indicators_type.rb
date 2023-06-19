class ChangeIndicatorsType < ActiveRecord::Migration[7.0]
  def up
    remove_column :indicators, :dynamic_attributes
    add_column :indicators, :dynamic_attributes, :text, default: [].to_json, null: false
  end

  def down
    remove_column :indicators, :dynamic_attributes
    add_column :indicators, :dynamic_attributes, :jsonb, default: {}, null: false
  end
end