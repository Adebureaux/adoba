class CreateIndicators < ActiveRecord::Migration[7.0]
  def change
    create_table :indicators do |t|

      t.timestamps
    end
  end
end
