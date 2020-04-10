require 'rails_helper'

RSpec.describe "accounting_entries/edit", type: :view do
  before(:each) do
    @accounting_entry = assign(:accounting_entry, AccountingEntry.create!(
      memo: "MyText"
    ))
  end

  it "renders the edit accounting_entry form" do
    render

    assert_select "form[action=?][method=?]", accounting_entry_path(@accounting_entry), "post" do

      assert_select "textarea[name=?]", "accounting_entry[memo]"
    end
  end
end
