# frozen_string_literal: true

Rails.application.routes.draw do
  get 'status_history/index'
  resources :applicants
  resources :funds
  resources :payments, only: [:index]
  resources :projects

  root 'applicants#index'
end
