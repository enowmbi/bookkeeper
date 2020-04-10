require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      name: "MyString",
      code: "MyString",
      category: "MyString"
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input[name=?]", "account[name]"

      assert_select "input[name=?]", "account[code]"

      assert_select "input[name=?]", "account[category]"
    end
  end
end
