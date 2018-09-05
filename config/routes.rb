Rails.application.routes.draw do

  devise_for :users
	resources :users do
    member do
      get :following, :followers
    end
  end

  root to: 'static_pages#home'
  get 'static_pages/contact'
  get 'static_pages/about'

  resources :relationships,       only: [:create, :destroy]
end
