require 'api_constraints'

Rails.application.routes.draw do
  root 'pages#status'

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resource :session, only: [:create, :destroy]

      resource :device,             only: [:show, :create, :update]
      resource :position,           only: [:update]
      resources :categories,        only: [:index]
      resources :departments,       only: [:index]
      resources :favorites,         only: [:index, :create, :destroy]
      resources :maps,              only: [:index]
      resources :messages,          only: [:index]
      resources :pins,              only: [:index, :show, :create, :destroy]
      resources :products,          only: [:index, :show]
      resources :streets,           only: [:index, :create, :update, :destroy]
      resources :super_departments, only: [:index]

      resources :stores, only: [ :index, :show ] do
        collection {get 'search' }
        resources :categories, only: [:index]
        resources :products,   only: [:index, :show]
        resources :stores,     only: [:index]

        resources :messages, only: [:index, :create, :show] do
          collection { get 'unread' }
        end
      end
    end
  end
end
