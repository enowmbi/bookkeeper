Rails.application.routes.draw do
  resources :journal_entries
  root "accounts#index"
  resources :accounts
  resources :accounting_entries
end
