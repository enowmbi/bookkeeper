class ReportsController < ApplicationController
  def index
  end

  def trial_balance
    if (params[:date] && params[:date].empty?) || params[:date].nil?  
      @as_of_date = Date.today
    else 
      @as_of_date = Date.parse(params[:date])
    end

    @entries =  trial_balance_query(@as_of_date)        

  end

  def income_statement
  end

  def balance_sheet
  end

  def cashflow_statement
  end

  private
  def trial_balance_query(date)
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
      where accounting_entries.date_posted <= '" + " #{date}' " +  
      "group by accounts.id"

      entries =  ActiveRecord::Base.connection.execute(query)
      return entries    

  end
end
