json.extract! accounting_entry, :id, :date_prepared, :date_posted, :memo, :created_at, :updated_at
json.url accounting_entry_url(accounting_entry, format: :json)
