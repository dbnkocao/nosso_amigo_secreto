require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryBot.create(:user)
    sign_in @current_user
  end

  describe "POST #create" do
    before(:each) do
      @campaign = create(:campaign, user: @current_user)

      @member_attributes = attributes_for(:member)
      @member_attributes[:campaign_id] = @campaign.id
      post :create, params: {member: @member_attributes}, format: :json
    end

    it "Responsde should be success" do
      expect(response).to have_http_status(200)
    end

    it "Create meber with right attributes" do
      expect(Member.last.campaign).to eql(@campaign)
      expect(Member.last.name).to eql(@member_attributes[:name])
      expect(Member.last.email).to eql(@member_attributes[:email])
    end

    # it "Create campaign with owner associated as a member" do
    #   expect(Campaign.last.members.last.name).to eql(@current_user.name)
    #   expect(Campaign.last.members.last.email).to eql(@current_user.email)
    # end
  end

  describe "PUT #update" do
    pending
  end

  describe "DELETE #destroy" do
    before(:each) do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "User is the Campaign Owner" do
      it "returns http success" do
        campaign = create(:campaign, user: @current_user)
        member = create(:member, campaign: campaign)
        delete :destroy, params: {id: member.id}
        expect(response).to have_http_status(:success)
      end
    end

    context "User isn't the Campaign Owner" do
      it "returns http forbidden" do
        member = create(:member)
        delete :destroy, params: {id: member.id}
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
