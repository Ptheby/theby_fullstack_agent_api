Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show, :update, :destroy] do
    post '/login', to: 'sessions#create'
    collection do
      post 'create_with_agent'
    end
  end

  resources :customers do
    resources :addresses, only: [:create, :update, :destroy]
  end

  resources :agents, only: [:index, :update]


end