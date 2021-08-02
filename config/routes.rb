Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions'
  }

  root 'home#index'

  namespace :admin do
    root 'dashboard#index'
    resources :dishes do
    end
  end
end
