require 'rails_helper'

RSpec.describe "accounting_entries/new", type: :view do
  before(:each) do
    assign(:accounting_entry, AccountingEntry.new(
      memo: "MyText"
    ))
  end

  it "renders new accounting_entry form" do
    render

    assert_select "form[action=?][method=?]", accounting_entries_path, "post" do

      assert_select "textarea[name=?]", "accounting_entry[memo]"
    end
  end
end
