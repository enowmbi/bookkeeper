# frozen_string_literal: true

# call query classes to generate reports
class ReportsController < ApplicationController
  def index; end

  def trial_balance
    @as_of_date = reporting_date(params[:date])
    @entries = Reports::TrialBalanceQuery.new(@as_of_date).call
  end

  def income_statement
    @date_from = reporting_date(params[:date_from])
    @date_to = reporting_date(params[:date_to])
    byebug
    @entries = Reports::IncomeStatementQuery.new(date_from: @date_from, date_to: @date_to).call
  end

  def balance_sheet; end

  def cashflow_statement; end

  private

  def reporting_date(date)
    if (date && date&.empty?) || date.nil?
      Date.today
    else
      Date.parse(date)
    end
  end
end
