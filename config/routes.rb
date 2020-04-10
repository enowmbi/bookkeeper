Rails.application.routes.draw do
  resources :accounting_entries
  root "accounts#index"
  resources :accounts
end
