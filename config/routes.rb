Rails.application.routes.draw do


  devise_for :users, controllers: { registrations: 'users/registrations',
                                    confirmations: 'users/confirmations',
                                    passwords: 'users/passwords',
                                    unlocks: 'users/unlocks',
                                    sessions: 'users/sessions'}  



  root to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact', as: 'contact'
  get 'about', to: 'static_pages#about', as: 'about'
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships,       only: [:create, :destroy]
end
