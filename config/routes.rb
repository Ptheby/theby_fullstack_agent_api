Rails.application.routes.draw do
  resources :users, only: [:create] do
    collection do
      post 'create_with_agent'
    end
  end

  resources :customers do
    resources :addresses, only: [:create, :update, :destroy]
    
  end

  post '/login', to: 'sessions#create'
end
  


# "resources :users do" generates RESTful routes for the User model. It provies standard CRUD routes for working with the user resource.
#'post 'create_with_agent', on: :collection' this line adds a customer action named 'create_with_agent' to the user resource. the on: :collection option means that this 
#action operates on the entire collection of users, not a specific user. W
#with these routes you have a standard RESTful routes for managing users and youve added a custom route to handle the specific case of creating a user with an associated agent. 
