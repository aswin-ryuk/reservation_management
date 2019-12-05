Rails.application.routes.draw do


  resources :restaurants  do
		collection do
			get :get_reservation
		end
  end

  resources :tables
  resources :reservations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

