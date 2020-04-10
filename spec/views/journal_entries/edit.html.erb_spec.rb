require 'rails_helper'

RSpec.describe "journal_entries/edit", type: :view do
  before(:each) do
    @journal_entry = assign(:journal_entry, JournalEntry.create!(
      amount: "9.99",
      post_type: "MyString",
      account: nil,
      accounting_entry: nil
    ))
  end

  it "renders the edit journal_entry form" do
    render

    assert_select "form[action=?][method=?]", journal_entry_path(@journal_entry), "post" do

      assert_select "input[name=?]", "journal_entry[amount]"

      assert_select "input[name=?]", "journal_entry[post_type]"

      assert_select "input[name=?]", "journal_entry[account_id]"

      assert_select "input[name=?]", "journal_entry[accounting_entry_id]"
    end
  end
end
