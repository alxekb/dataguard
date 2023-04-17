# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :lunch_events do
    resources :create_event, only: %i[index create]
    resources :create_groups, only: %i[index create]
    resources :allocate_groups, only: %i[index create]
    resources :allocated_groups, only: %i[index]
  end

  resources :lunch_events, only: %i[index show]
  resources :groups, only: %i[index show]
end
