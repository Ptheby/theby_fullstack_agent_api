Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show, :update, :destroy] do
    collection do
      post 'create_with_agent'
    end
  end

  post '/login', to: 'sessions#create'  # Define login route here

  resources :customers do
    collection do
      post 'create_with_address'
    end
    resources :policies, only: [:index, :update, :create, :show, :destroy]
    resources :addresses, only: [:create, :update, :destroy, :index]
  end

  resources :agents, only: [:index, :update, :show, :create] do
    resources :customers, only: [:index]  # Route to get customers by agent ID
  end

  post '/assign_customer', to: 'agents#assign_customer', as: 'assign_customer'

  get '/your-customers', to: 'customers#your_customers', as: 'your-customers'

  get '/user', to: 'users#show'
end
