require 'rails_helper'

RSpec.describe "PrimaryItemLists", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/primary_item_lists/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/primary_item_lists/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/primary_item_lists/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/primary_item_lists/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/primary_item_lists/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
