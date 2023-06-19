class ChangeDynamicAttributes < ActiveRecord::Migration[7.0]
  def up
    change_column :indicators, :dynamic_attributes, :string, array: true, null: false
  end

  def down
    change_column :indicators, :dynamic_attributes, :text, default: '[]', null: false
  end
end
