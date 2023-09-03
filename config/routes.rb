Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :contents, only: [:index, :show, :create, :update, :destroy]

      get 'contents/index'
      get 'contents/show'
      get 'contents/create'
      get 'contents/update'
      get 'contents/destroy'

      post 'users/signup', to: 'users#signup'

      post 'auth/signin', to: 'auth#signin'


    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


end
