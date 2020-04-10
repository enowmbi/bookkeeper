require 'rails_helper'

RSpec.describe "journal_entries/new", type: :view do
  before(:each) do
    assign(:journal_entry, JournalEntry.new(
      amount: "9.99",
      post_type: "MyString",
      account: nil,
      accounting_entry: nil
    ))
  end

  it "renders new journal_entry form" do
    render

    assert_select "form[action=?][method=?]", journal_entries_path, "post" do

      assert_select "input[name=?]", "journal_entry[amount]"

      assert_select "input[name=?]", "journal_entry[post_type]"

      assert_select "input[name=?]", "journal_entry[account_id]"

      assert_select "input[name=?]", "journal_entry[accounting_entry_id]"
    end
  end
end
