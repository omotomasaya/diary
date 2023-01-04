namespace :admin do
  resources :dashboards
end

devise_for :admin_users, path: "admin/users", module: "admin/admin_users"
