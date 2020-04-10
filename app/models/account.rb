class Account < ApplicationRecord

  CATEGORIES = %w(Assets Liabilities Equity Revenue Expenses)

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: {in: CATEGORIES}

  def to_s
    "#{code} - #{name}"
  end

end
