Rails.application.routes.draw do
  get 'sessions/new'
  get 'cart' => 'product#cart'
  get 'checkout' => 'product#checkout'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'sale' => 'search#sale'
  get 'recent' =>'search#recent'
  get 'result' =>'search#result'
  get 'about' =>'search#about'
  get 'contact' =>'search#contact'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :category, only: [:show]
  resources :user
  resources :product, only: [:index, :show]do
    member do
      post :add_item
      post :remove_item
    end
    collection do
      post :clear_cart
      post :make_order
    end
  end

  root to: 'product#index'
end
