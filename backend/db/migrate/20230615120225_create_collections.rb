class CreateCollections < ActiveRecord::Migration[7.0]
	def change
		create_table :collections do |t|
			t.string :name
			t.datetime :date
			t.string :association_name
			t.timestamps
		end
	end
end

#			t.jsonb :dynamic_attributes, default: {}