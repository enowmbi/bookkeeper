Rails.application.routes.draw do
  root "accounts#index"
  resources :accounts
  resources :accounting_entries do 
    resources :journal_entries
  end
end
