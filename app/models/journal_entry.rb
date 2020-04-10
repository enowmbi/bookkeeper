class JournalEntry < ApplicationRecord

  belongs_to :account
  belongs_to :accounting_entry

  POST_TYPES = %w(Debit Credit)
end
