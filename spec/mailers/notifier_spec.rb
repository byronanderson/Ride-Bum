require 'spec_helper'
describe Notifier do
  context ".invitation" do
    let(:event) { Factory(:event) }
    let(:invitation) { Factory(:invitation, event: event) }
    let(:email) { Notifier.invitation(invitation) }
    it "should have a link to the event page" do
      email.should have_content(event_path(event))
    end
  end
end
