Rails.application.routes.draw do
  get 'receptions/index'
  get 'receptions/new'
  get 'receptions/create'
  get 'receptions/edit'
  get 'receptions/update'
  get 'samples/index'
  get 'samples/new'
  get 'samples/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
