class CollectionsController < ApplicationController
	# Display instances of collections in the database
	def index
		@collections = Collection.all
		render json: @collections
	end

	# Make an instance of the collection
	def create
		@collection = Collection.new(
			name:params[:name],
			date:params[:date],
			association_name: params[:association_name]
		)

		# Assign dynamic attributes to the collection
		@collection.dynamic_attributes = params[:dynamic_attributes]

		if @collection.save
			render json: @collection
		else
			render json: { error: @collection.errors.full_messages.map { |msg| msg.gsub(/^(Name|Association name)\s/, '') } }, status: :unprocessable_entity
		end
	end

	# Update an instance of an existing collection
	def update
		@collection = Collection.find(params[:id])
		@collection.update(
			name: params[:name],
			date: params[:date],
			association_name: params[:association_name]
		)
		# Update dynamic attributes
		@collection.dynamic_attributes = params[:dynamic_attributes]

		render json: @collection
	end

	# Get rid of a collection item
	def destroy
		@collection = Collection.all
		@collection = Collection.find(params[:id])
		@collection.destroy
		render json: @collection
	end

	# Get the number of collection element
	def count
		count = Collection.count
		render json: { count: count }
	end
end
