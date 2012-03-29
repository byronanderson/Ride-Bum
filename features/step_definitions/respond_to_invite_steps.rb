Given /^I have received an invite to go to the "([^"]*)"$/ do |event_name|
  @user = FactoryGirl.create(:invitee)
  @event = FactoryGirl.create(:event, name: event_name)
  @invitation = FactoryGirl.create(:invitation, user: @user, event: @event)
  @email = Notifier.invitation(@invitation)
end

When /^I follow the RSVP link in the email$/ do
  # /events/:id?token=asdflkajsdfklj
  match = @email.body.to_s.match(/\/events\/\d+\?token=[\d\w]+/m)
  rsvp_link_path = match[0]
  visit rsvp_link_path
end

Then /^I see the event details$/ do
  page.should have_content(@event.name)
end
