Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions'
  }

  root 'home#index'

  get 'menu', to: 'home#menu'

  namespace :admin do
    # root 'dashboard#index'
    get 'dishes?dish_type=entree' => 'dishes#index', as: :root
    resources :dishes do
      member do
        put :update_position
      end
    end
  end
end
