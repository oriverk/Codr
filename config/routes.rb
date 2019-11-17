# frozen_string_literal: true

Rails.application.routes.draw do
    
  root 'posts#index'
  resources :posts

  get 'user' => 'users#edit', as: :edit_user
  patch 'user' => 'users#update'
  put 'user' => 'users#update'
  delete 'user' => 'users#destroy'

  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks" }
 
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    post 'signup', to: 'devise/registrations#create'

    get 'login', to: 'devise/sessions#new'
    post 'login' => 'devise/sessions#create'
    get 'logout', to: 'devise/sessions#destroy'

    get 'register' => 'devise/registrations#edit'
    patch 'register' => 'devise/registrations#update'
    put 'register' => 'devise/registrations#update'
    delete 'register' => 'devise/registrations#destroy'
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end