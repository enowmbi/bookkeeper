FactoryBot.define do
  factory :journal_entry do
    amount { "9.99" }
    post_type { "MyString" }
    account { nil }
    accounting_entry { nil }
  end
end
