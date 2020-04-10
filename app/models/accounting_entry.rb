class AccountingEntry < ApplicationRecord

  has_many :journal_entries

end
