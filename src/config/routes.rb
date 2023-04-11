# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :lunch_events do
    resources :create_event, only: %i[index create]
  end

  resources :lunch_events, only: %i[index show]
end
