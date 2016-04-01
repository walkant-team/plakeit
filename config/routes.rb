Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'

  scope "(:locale)", locale: /en|es/ do
    root 'static_pages#index'
    resources :suscriptors, only: [:create]

    namespace :business do
      root 'static_pages#index'
      resources :suscriptors, only: [:create, :new]
    end
  end

end
