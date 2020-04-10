Rails.application.routes.draw do
  root "accounts#index"
  resources :accounts
  resources :accounting_entries do 
    resources :journal_entries
  end
  get 'reports/index'
  get 'reports/trial_balance'
  get 'reports/income_statement'
  get 'reports/balance_sheet'
  get 'reports/cashflow_statement'
end
