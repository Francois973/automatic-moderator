Rails.application.routes.draw do
  resources :moderable_models, only: %i[index new create]
  resources :posts, only: %i[index new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
