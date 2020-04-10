json.extract! journal_entry, :id, :amount, :post_type, :account_id, :accounting_entry_id, :created_at, :updated_at
json.url journal_entry_url(journal_entry, format: :json)
