require 'rails_helper'

RSpec.describe "journal_entries/show", type: :view do
  before(:each) do
    @journal_entry = assign(:journal_entry, JournalEntry.create!(
      amount: "9.99",
      post_type: "Post Type",
      account: nil,
      accounting_entry: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Post Type/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
