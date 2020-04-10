require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        name: "Name",
        code: "Code",
        category: "Category"
      ),
      Account.create!(
        name: "Name",
        code: "Code",
        category: "Category"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Code".to_s, count: 2
    assert_select "tr>td", text: "Category".to_s, count: 2
  end
end
