Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/test", to: 'pages#test'
  resources :samples, only: [:show, :new, :create, :edit, :update] do
    collection do
      get 'pending_index', to: 'samples#pending_index'
      get 'received_index', to: 'samples#received_index'
      get 'tested_index', to: 'samples#tested_index'
      get 'labelled_index', to: 'samples#labelled_index'
      get 'sent_index', to: 'samples#sent_index'
    end
    member do
      post 'update_after_test', to: 'samples#update_after_test'
    end
  end

  resources :receptions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
