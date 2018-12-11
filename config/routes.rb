Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :samples, only: [:new, :create, :edit, :update] do
    collection do
      get 'pending_index', to: 'samples#pending_index'
      get 'received_index', to: 'samples#received_index'
      get 'tested_index', to: 'samples#tested_index'
      get 'labelled_index', to: 'samples#labelled_index'
      get 'sent_index', to: 'samples#sent_index'
      # get 'search_sample_index' to: 'samples#search_sample_index'
    end

    member do
      post 'update_after_reception', to: 'samples#update_after_reception'
      post 'update_after_test', to: 'samples#update_after_test'
      post 'update_after_labelling', to: 'samples#update_after_labelling'
      post 'update_after_emailing', to: 'samples#update_after_emailing'
      post 'email'
    end

    resources :etiquettes, only: [:create]

  end
  resources :coffeelots, only: [:show, :update]

  resources :receptions
  resources :etiquettes, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
