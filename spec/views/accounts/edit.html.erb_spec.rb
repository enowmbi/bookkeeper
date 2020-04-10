require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      name: "MyString",
      code: "MyString",
      category: "MyString"
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input[name=?]", "account[name]"

      assert_select "input[name=?]", "account[code]"

      assert_select "input[name=?]", "account[category]"
    end
  end
end
