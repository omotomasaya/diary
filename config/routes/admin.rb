namespace :admin do
  resources :dashboards, only: [:index]
  resources :notifications
end

devise_for :admin_users, path: "admin/users", module: "admin/admin_users"
