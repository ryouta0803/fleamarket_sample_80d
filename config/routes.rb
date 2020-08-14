Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root 'items#index'

  resources :users, only: :show

  # resources :users, only: [:edit, :update]
  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'purchase', to: 'items#purchase'
    end
  end
  
  resources :items
    #Ajaxで動くアクションのルートを作成
    resources :items, only: [:new, :show, :create, :edit, :update, :destroy] do

      collection do
        get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
        get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
      end
      
      resources :buyers, only: [:index] do
        collection do
          get 'done', to: 'buyers#done'
          post 'pay', to: 'buyers#pay'
        end
      end
    end
  end