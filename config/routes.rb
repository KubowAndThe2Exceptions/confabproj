Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'static_pages/home'
  get 'static_pages/show'
  root "static_pages#home"

  devise_for :users, :controllers => { registrations: 'registrations'}

  resources :searches

  get "/articles", to: "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
