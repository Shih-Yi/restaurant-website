Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions'
  }

  root 'home#index'

  get 'menu', to: 'home#menu'

  namespace :admin do
    # root 'dashboard#index'
    get '/' => 'notices#show', as: :root

    resource :notice do
    end

    resources :dishes do
      member do
        put :update_position
      end
    end
  end
end
