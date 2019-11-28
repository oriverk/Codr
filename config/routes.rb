# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  get 'privacy' => 'static_pages#privacy'

  resources :posts do
    # collection do
    #   get 'search'
    # end
  end

  get 'user' => 'users#edit', as: :edit_user
  patch 'user' => 'users#update'
  put 'user' => 'users#update'
  delete 'user' => 'users#destroy'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  devise_scope :user do
    get 'signup' => 'devise/registrations#new'
    post 'signup' => 'devise/registrations#create'

    get 'login' => 'devise/sessions#new'
    post 'login' => 'devise/sessions#create'
    get 'logout' => 'devise/sessions#destroy'

    get 'register' => 'devise/registrations#edit'
    patch 'register' => 'devise/registrations#update'
    put 'register' => 'devise/registrations#update'
    delete 'register' => 'devise/registrations#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
