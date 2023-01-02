namespace :admin do
  resources :dashboards

  devise_for :admin_users, path: :users, controllers: {
    sessions: 'admin/admin_users/sessions'
  }
end
