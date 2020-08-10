Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :items
    # resources :comments 準備のみ
  root 'items#index'
  # resources :users, only: [:edit, :update]
end
