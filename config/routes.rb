# frozen_string_literal: true

Rails.application.routes.draw do
  get 'item/index'
  get 'item/new'
  get 'item/create'
  get 'item/update'
  get 'item/destroy'
  resources :comments
  devise_for :users
end
