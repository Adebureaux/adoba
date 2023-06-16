Rails.application.routes.draw do
	resources :collections, only: [:index, :show, :create, :update, :destroy] do
		collection do
			get 'count', to: 'collections#count'
		end
	end
end
