Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'posts', to: 'posts#index'
  root to: 'prototypes#index'

  resources :prototypes, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: [:create]
  end

  resources :users
end
