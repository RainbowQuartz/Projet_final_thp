Rails.application.routes.draw do

resources :users, only: [:following, :followers, :show, :destroy, :index] do 
    member do
      get :following, :followers
    end
  end

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    confirmations: 'users/confirmations',
                                    passwords: 'users/passwords',
                                    unlocks: 'users/unlocks',
                                    sessions: 'users/sessions'}  



  root to: 'static_pages#home'
  get 'static_pages/contact'
  get 'static_pages/about'

  resources :relationships,       only: [:create, :destroy]
end
