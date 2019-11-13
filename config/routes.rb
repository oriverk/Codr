# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registration: 'users/registration',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    # get 'users/:id', to: 'users/registrations#detail'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
  end
  get '/', to: 'posts#index'
  resources :posts
  get 'users/:id', to: 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
