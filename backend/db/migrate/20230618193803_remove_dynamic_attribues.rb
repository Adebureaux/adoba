class RemoveDynamicAttribues < ActiveRecord::Migration[7.0]
  def change
    remove_column :indicators, :dynamic_attributes
  end
end
