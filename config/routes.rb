# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'users'

      resources :users, except: [:create] do
        resources :columns do
          resources :cards do
            resources :comments
          end
        end
      end
    end
  end
end
