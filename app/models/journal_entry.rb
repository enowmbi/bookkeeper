class JournalEntry < ApplicationRecord
  belongs_to :account
  belongs_to :accounting_entry
end
