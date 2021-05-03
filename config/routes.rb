Rails.application.routes.draw do
  root to: "home#index"

  resources :home, only: %i[index show]

  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
