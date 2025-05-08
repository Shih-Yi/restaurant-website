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
    
    resources :dish_groups do
      member do
        put :update_position
      end
    end

    get 'dashboard/edit_background_images', to: 'dashboard#edit_background_images', as: :edit_background_images
    post 'dashboard/edit_background_images', to: 'dashboard#edit_background_images'
    delete 'dashboard/remove_background_image', to: 'dashboard#remove_background_image', as: :remove_background_image
  end
end
