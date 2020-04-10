require 'rails_helper'

RSpec.describe "accounting_entries/show", type: :view do
  before(:each) do
    @accounting_entry = assign(:accounting_entry, AccountingEntry.create!(
      memo: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
