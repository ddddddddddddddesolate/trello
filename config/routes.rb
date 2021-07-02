# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :users do
        resources :columns do
          resources :cards do
            resources :comments
          end
        end
      end
    end
  end
end
