require 'spec_helper'

describe InvitationsController do
  context "POST create" do
    let(:event) { FactoryGirl.create(:event) }
    before do
      @user_attributes = 
        {
              email: "byron@wherever.com",
              phone: "1234567890"
        }
      @parameters = {
        invitation: {
          event_id: event.id,
          user_attributes: @user_attributes
        } 
      }
    end

    context "without already created user" do
      it "should create a user" do
        expect {
          post :create, @parameters
        }.to change(User, :count).by(1)
      end

      it "should create the invitation" do
        post :create, @parameters
        Invitation.last.user.email.should == "byron@wherever.com"
      end
    end

    context "with already created user" do
      before do
        User.create!(@user_attributes)
      end

      it "should not create a user" do
        expect {
          post :create, @parameters
        }.to_not change(User, :count).by(1)
      end

      it "should create the invitation" do
        expect {
          post :create, @parameters
        }.to change(Invitation, :count).by(1)
        Invitation.last.user.email.should == "byron@wherever.com"
      end
    end
  end
end
