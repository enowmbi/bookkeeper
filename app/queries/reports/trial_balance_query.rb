# frozen_string_literal: true

module Reports
  # Run query to generate trial balance
  class TrialBalanceQuery
    def initialize(date)
      @date = date
    end

    def call
      query = "SELECT
    accounts.id,
      accounts.code,
      accounts.name,
      sum(CASE post_type
          WHEN 'Debit' THEN journal_entries.amount
          END) as debit,
      sum(CASE post_type
          WHEN 'Credit' THEN journal_entries.amount
          END) as credit
      from
      accounts
      inner join
      journal_entries
      on accounts.id = journal_entries.account_id
      inner join
      accounting_entries
      on accounting_entries.id = journal_entries.accounting_entry_id
      where accounting_entries.date_posted <= '" + " #{date}' " + 'group by accounts.id'

      entries = ActiveRecord::Base.connection.execute(query)
      entries
    end

    private

    attr_reader :date
  end
end
