Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  # get "/users", to: "user#index"
  # get "/users/:id", to:"user#show"
  # post "/users", to: "user#create"
  # patch "/users/:id", to: "user#update"
  # delete "/users/:id", to: "user#destroy"
  # post "/users/nest_test", to: "user#nest"

  resources :users, only:[:index, :show, :update, :delete, :create] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  resources :artworks, only:[:index, :show, :update, :delete, :create] do
    resources :comments, only: [:index]
  end
  resources :artwork_shares, only:[:create]
  resources :comments, only: [:create, :destroy, :index, :show]

end
