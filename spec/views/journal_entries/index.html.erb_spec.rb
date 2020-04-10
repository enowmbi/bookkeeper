require 'rails_helper'

RSpec.describe "journal_entries/index", type: :view do
  before(:each) do
    assign(:journal_entries, [
      JournalEntry.create!(
        amount: "9.99",
        post_type: "Post Type",
        account: nil,
        accounting_entry: nil
      ),
      JournalEntry.create!(
        amount: "9.99",
        post_type: "Post Type",
        account: nil,
        accounting_entry: nil
      )
    ])
  end

  it "renders a list of journal_entries" do
    render
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Post Type".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
