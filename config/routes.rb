Rails.application.routes.draw do

  get 'languages/edit'
  post 'languages/edit', to: 'languages#create'
  delete 'languages/edit', to: 'languages#delete'
  get 'interests/edit'
  post 'interests/edit', to: 'interests#update'
  devise_for :users, controllers: {
                                    sessions: 'users/sessions',
                                    registrations: 'users/registrations'
                                   }

  root to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact', as: 'contact'
  get 'about', to: 'static_pages#about', as: 'about'

  post 'users/edit', to: 'users#delete'

  resources :users do
    resources :chats, only: [:index, :show, :create]
    member do
      get :following, :followers, :match
    end
  end

  resources :messages, only: [:create]
  resources :relationships, only: [:create, :destroy]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

end
