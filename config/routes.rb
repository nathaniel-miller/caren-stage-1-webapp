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
   root to: "dashboard#index"

  devise_for :users,
             path: '',
             path_names: { sign_in: 'login',
                           sign_out: 'logout',
                           sign_up: 'register',
                           edit: 'settings' }

end

