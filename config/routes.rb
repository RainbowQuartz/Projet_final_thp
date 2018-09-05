Rails.application.routes.draw do

  devise_for :users
	resources :users

  root to: 'static_pages#home'
  get 'static_pages/contact'
  get 'static_pages/about'

  resources :messages
  get '/demo', to: 'messages#demo'
end
