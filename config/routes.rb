Rails.application.routes.draw do
  resources :tasks
  resources :posts
  resources :important_info_pieces
  resources :categories
  resources :task_generators
  resources :invitations
  resources :positions, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :roles
  resources :circles, only: [:new, :create, :show, :edit, :update, :destroy]
  get 'dashboard/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "dashboard#index"
end
