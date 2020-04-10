require 'rails_helper'

RSpec.describe "Reports", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/reports/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /trial_balance" do
    it "returns http success" do
      get "/reports/trial_balance"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /income_statement" do
    it "returns http success" do
      get "/reports/income_statement"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /balance_sheet" do
    it "returns http success" do
      get "/reports/balance_sheet"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /cashflow_statement" do
    it "returns http success" do
      get "/reports/cashflow_statement"
      expect(response).to have_http_status(:success)
    end
  end

end
