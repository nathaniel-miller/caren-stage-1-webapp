Rails.application.routes.draw do
  resources :invitations
  resources :task_generators
  resources :roles
  resources :positions
  resources :circles
  get 'dashboard/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "dashboard#index"
end
