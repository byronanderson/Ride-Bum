When /^he fills in "([^"]*)" with "([^"]*)"$/ do |area, text|
  fill_in area, with: text
end

When /^he clicks "([^"]*)"$/ do |text|
  click_on text
end
