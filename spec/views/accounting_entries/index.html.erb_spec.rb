require 'rails_helper'

RSpec.describe "accounting_entries/index", type: :view do
  before(:each) do
    assign(:accounting_entries, [
      AccountingEntry.create!(
        memo: "MyText"
      ),
      AccountingEntry.create!(
        memo: "MyText"
      )
    ])
  end

  it "renders a list of accounting_entries" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
