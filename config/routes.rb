Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  
  root to: "pages#index"

  resources :employees
  resources :payslips
  post "payslips/new_ps", to: "payslips#new_ps", as: :new_ps
end
