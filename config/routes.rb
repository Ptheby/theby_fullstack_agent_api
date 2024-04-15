Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show, :update, :destroy] do
    collection do
      post 'create_with_agent'
    end
  end
 
  post '/login', to: 'sessions#create'  # Define login route here

  resources :customers do
    resources :policies, only: [:index, :update, :create, :show, :destroy]

    collection do

      post 'create_with_address'
    end
    resources :addresses, only: [:create, :update, :destroy, :index]
  end

  resources :agents, only: [:index, :update,:show, :create] 
  post '/assign_customer', to: 'agents#assign_customer', as: 'assign_customer'

  end

   
  
  
