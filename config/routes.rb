Rails.application.routes.draw do
  #devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :customers, only: [:edit, :update] do
  	collection do
  	  get :dashboard 		
  	end
  end

  resources :admins, only: [:edit, :update] do
    collection do
      get :dashboard    
    end
  end

  namespace :admin do
    resources :customers, only: [:index, :edit, :update]
  end

  resources :messages, except: [:edit, :update]
end
