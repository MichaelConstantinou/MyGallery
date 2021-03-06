# frozen_string_literal: true

Rails.application.routes.draw do
  resources :images
  resources :galleries
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'galleries#index'
end
