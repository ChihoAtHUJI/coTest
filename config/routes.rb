Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :contents, only: [:show, :create, :update, :destroy], path: 'contents'
      get 'content', to: 'contents#index'

      post 'users/signup', to: 'users#signup'

      post 'auth/signin', to: 'auth#signin'


    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


end
