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
  @event = FactoryGirl.create(:event, name: event_name)
end

Given /^the event has the following invitees:$/ do |table|
  # | name | email | phone |
  table.hashes.each do |row|
    FactoryGirl.create(:invitation, event: @event, user: FactoryGirl.create(:user, username: row[:name], email: row[:email], phone: row[:phone]))
  end
end

Given /^no invitation emails have been sent out$/ do
  pass
end

Given /^they have already received email invitations$/ do
  Invitation.all.each do |invitation|
    invitation.email_sent = true
    invitation.save
  end
end
