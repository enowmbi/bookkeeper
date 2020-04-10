FactoryBot.define do
  factory :accounting_entry do
    date_prepared { "2020-04-10" }
    date_posted { "2020-04-10" }
    memo { "MyText" }
  end
end
