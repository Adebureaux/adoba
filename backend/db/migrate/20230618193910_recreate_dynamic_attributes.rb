class RecreateDynamicAttributes < ActiveRecord::Migration[7.0]
  def change
    add_column :indicators, :dynamic_attributes, :string, array: true
  end
end
