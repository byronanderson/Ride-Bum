Given /^he is on the "([^"]*)" event page$/ do |event_name|
  visit event_path(Event.find_by_name(event_name))
end

When /^he types "([^"]*)" in the invitations field$/ do |text|
  @invitees ||= []
  @invitees << text
  fill_in "Invitations", with: @invitees.join("\n")
end

When /^clicks "([^"]*)"$/ do |text|
  click_on text
end

Then /^he should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Given /^there is a "([^"]*)" event$/ do |event_name|
  @event = Factory(:event, name: event_name)
end

Given /^the event has the following invitees:$/ do |table|
  # | name | email | phone |
  table.hashes.each do |row|
    #invitee = Factory(:invitee)
    #Factory(:invitation, event: @event, invitee: invitee) #user??
    #could say that invitation has_one invitee, and separate them into different tables even if you don't want to explicitly save an invitee as a user for later
    Factory(:invitation, event: @event, invitee_name: row[:name], invitee_email: row[:email], invitee_phone: row[:phone])
    #invitee
  end
end

Given /^no invitation emails have been sent out$/ do
  pass
end

Given /^they have already received email invitations$/ do
  pending("some thought on the matter of where that information will be stored")
  @invitees.each do |invitee|
  end
end
