Rails.application.routes.draw do

  root 'home#index'
  resources :scrappers

  get 'category/:category' => 'home#index', as: :category_events

  resources :public_events, only: [:show], path: 'events'

  # sessions
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy', as: :logout


  scope "(:locale)", locale: /en|es/ do
    namespace :clients do
      root 'static_pages#index'
      resources :suscriptors, only: [:create]
    end

    namespace :business do
      root 'static_pages#index'
      resources :suscriptors, only: [:create, :new]
    end
  end

end
