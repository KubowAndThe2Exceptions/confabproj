Rails.application.routes.draw do
  resources :users
  get 'static_pages/home'
  get 'static_pages/show'
  root "static_pages#home"

  resources :searches

  get "/articles", to: "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
