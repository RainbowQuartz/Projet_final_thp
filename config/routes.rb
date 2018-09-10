Rails.application.routes.draw do


  get 'languages/edit'
  post 'languages/edit', to: 'languages#update'
  get 'interests/edit'
  post 'interests/edit', to: 'interests#update'
  devise_for :users, controllers: {
                                    sessions: 'users/sessions',
                                    registrations: 'users/registrations'
                                   }

  root to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact', as: 'contact'
  get 'about', to: 'static_pages#about', as: 'about'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

end
