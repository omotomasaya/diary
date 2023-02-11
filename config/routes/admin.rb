namespace :admin do
  resources :app_users
  resources :categories, except: [:show, :destroy]
  resources :dashboards, only: [:index]
  resources :notifications, except: [:show, :destroy]
end

devise_for :admin_users, path: "admin/users", module: "admin/admin_users"
