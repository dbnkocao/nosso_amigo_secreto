require 'rails_helper'

RSpec.describe MembersController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      pending
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      pending
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      pending
      get :update
      expect(response).to have_http_status(:success)
    end
  end

end
