Rails.application.routes.draw do
  resources :confirmations, only: :show

  resource :version, only: :show

  resources :products, only: %i(index show)

  resources :categories, only: :index do
    resources :products, only: :index
  end

  resources :orders, only: :create

  resources :purchases, only: %i(create update destroy)

  resource :session, only: %i(create destroy)

  namespace :facebook do
    resource :session, only: %i(create destroy)
  end

  namespace :twitter do
    resource :session, only: %i(create destroy)
  end
end
