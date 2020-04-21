class ReportsController < ApplicationController
  def index
  end

  def trial_balance
    @as_of_date = set_date(params[:date])
    @entries =  trial_balance_query(@as_of_date)        
  end

  def income_statement
    @date_from = set_date(params[:date_from])
    @date_to = set_date(params[:date_to])
    @entries =  income_statement_query(@date_from, @date_to)        
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


  def income_statement_query(date_from,date_to)
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
      where (category ='Expenses' or category ='Revenue') and (accounting_entries.date_posted >= '" + " #{date_from}' and accounting_entries.date_posted <= '" + "#{date_to} ')" +   
      "group by accounts.id"

      entries =  ActiveRecord::Base.connection.execute(query)
      return entries    

  end

  def set_date(date)
    if (date && date.empty?) || date.nil?  
      Date.today
    else 
      Date.parse(date)
    end
  end

end
