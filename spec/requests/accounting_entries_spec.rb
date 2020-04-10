 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/accounting_entries", type: :request do
  # AccountingEntry. As you add validations to AccountingEntry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      AccountingEntry.create! valid_attributes
      get accounting_entries_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      accounting_entry = AccountingEntry.create! valid_attributes
      get accounting_entry_url(accounting_entry)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_accounting_entry_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      accounting_entry = AccountingEntry.create! valid_attributes
      get edit_accounting_entry_url(accounting_entry)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new AccountingEntry" do
        expect {
          post accounting_entries_url, params: { accounting_entry: valid_attributes }
        }.to change(AccountingEntry, :count).by(1)
      end

      it "redirects to the created accounting_entry" do
        post accounting_entries_url, params: { accounting_entry: valid_attributes }
        expect(response).to redirect_to(accounting_entry_url(AccountingEntry.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new AccountingEntry" do
        expect {
          post accounting_entries_url, params: { accounting_entry: invalid_attributes }
        }.to change(AccountingEntry, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post accounting_entries_url, params: { accounting_entry: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested accounting_entry" do
        accounting_entry = AccountingEntry.create! valid_attributes
        patch accounting_entry_url(accounting_entry), params: { accounting_entry: new_attributes }
        accounting_entry.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the accounting_entry" do
        accounting_entry = AccountingEntry.create! valid_attributes
        patch accounting_entry_url(accounting_entry), params: { accounting_entry: new_attributes }
        accounting_entry.reload
        expect(response).to redirect_to(accounting_entry_url(accounting_entry))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        accounting_entry = AccountingEntry.create! valid_attributes
        patch accounting_entry_url(accounting_entry), params: { accounting_entry: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested accounting_entry" do
      accounting_entry = AccountingEntry.create! valid_attributes
      expect {
        delete accounting_entry_url(accounting_entry)
      }.to change(AccountingEntry, :count).by(-1)
    end

    it "redirects to the accounting_entries list" do
      accounting_entry = AccountingEntry.create! valid_attributes
      delete accounting_entry_url(accounting_entry)
      expect(response).to redirect_to(accounting_entries_url)
    end
  end
end