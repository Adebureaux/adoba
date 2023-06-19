Rails.application.routes.draw do

  resources :indicators, only: [:index, :update, :destroy]
		delete '/indicators', to: 'indicators#destroy'

	resources :collections, only: [:index, :show, :create, :update, :destroy] do
		collection do
			get 'count', to: 'collections#count'
		end
	end

end
