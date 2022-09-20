Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: 'lists#index'
  # resources :lists, only: [:create, :new, :index, :show] do
  #   resources :bookmarks, only: [:create, :new]
  # end

  root to: 'lists#index'
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:create, :new]
  end
  resources :bookmarks, only: :destroy
end
