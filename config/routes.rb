Rails.application.routes.draw do

  resources :categories
  resources :roles
  resources :invitations

  resources :circles, except: [:index] do
    resources :tasks
    resources :posts
    resources :important_info_pieces
    resources :task_generators
    resources :positions, except: [:index]
  end
  
  get 'dashboard/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "dashboard#index"
end
