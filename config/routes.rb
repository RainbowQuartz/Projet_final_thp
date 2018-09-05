Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    confirmations: 'users/confirmations',
                                    passwords: 'users/passwords',
                                    unlocks: 'users/unlocks'}
	resources :users

  root to: 'static_pages#home'
  get 'static_pages/contact'
  get 'static_pages/about'
end
