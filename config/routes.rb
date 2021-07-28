Rails.application.routes.draw do

  root to: "users#index"

  resources :users, only: %i[index show] do
    resources :payments, only: [] do
      get :active
      get :inactive
    end
  end

  devise_for :users,
             controllers: {
               registrations: 'users/registrations'
             }

  authenticate :user, lambda { |u| u.admin? } do
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
