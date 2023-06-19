Rails.application.routes.draw do

  resources :indicators, only: [:index, :update, :destroy]
		delete '/indicators', to: 'indicators#destroy'
		patch '/indicators', to: 'indicators#update'

	resources :collections, only: [:index, :create] do
		collection do
			get 'count', to: 'collections#count'
		end
	end

end
