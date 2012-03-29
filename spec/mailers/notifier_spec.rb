require 'spec_helper'
describe Notifier do
  context ".invitation" do
    let(:event) { Factory(:event) }
    let(:invitation) { Factory(:invitation, event: event) }
    let(:email) { Notifier.invitation(invitation) }

    it "should have a link to the event page" do
      email.should have_content(event_path(event))
    end

    it "should have the token associated with the invited user" do
      email.should have_content(invitation.user.authentication_token)
    end
    it "should have the event's name somewhere in the email" do
      email.should have_content(event.name)
    end
  end
end
