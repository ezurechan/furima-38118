Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :item do
    resources :order, only: :create do
      resources :shipment, only: :create
    end
  end

  resources :items
end
