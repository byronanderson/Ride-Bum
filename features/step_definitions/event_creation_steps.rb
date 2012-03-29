Given /^"([^"]*)" is an event planner$/ do |event_planner_name|
  # this is probably wrong, event planner might not be a separate model
  pass
  #@user = FactoryGirl(:event_planner, name: event_planner_name)
end

Given /^he is logged in$/ do
  pass
  #log_in(@user)
end

Given /^he is on his dashboard page$/ do
  visit dashboard_path
end

When /^he clicks on "([^"]*)"$/ do |text|
  click_on text
end

When /^he enters the destination "([^"]*)"$/ do |destination|
  fill_in "Destination", with: destination
end

When /^he enters the name "([^"]*)"$/ do |name|
  fill_in "Event Name", with: name
end

When /^he enters the start date and time "([^"]*)"$/ do |datetime|

  
  time = DateTime.parse(datetime)
  select time.year.to_s,      from: "event[arrival_time(1i)]"
  select time.strftime("%B"), from: "event[arrival_time(2i)]"
  select time.day.to_s,       from: "event[arrival_time(3i)]"
  select time.hour.to_s,      from: "event[arrival_time(4i)]"
  select time.minute.to_s,    from: "event[arrival_time(5i)]"
  # datetime selection
end

Then /^he sees "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^he is on the event's page$/ do
  # which event?  we have no event variable at this point
  Event.last
end
