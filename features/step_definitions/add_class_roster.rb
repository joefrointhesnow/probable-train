Given(/^I am on the create activity page$/) do 
    visit('/create_activity')
end

When(/^I click on the select class roster$/) do 
    fill_in 'activity_roster', :with => string
end

Then(/^the roster is selected$/) do
    selected 'activity_roster'
end

Given(/^I am on the edit activity page$/) do
    visit('edit_activity')
end

When(/^I click on the select class roster$/) do
    fill_in 'activity_roster', :with => string
end

Then(/^I can edit the class roster that is selected$/) do
    fill_in 'activity_roster', :with => string
end

Given(/^I am on the create activity page or the edit activity page$/) do
    visit('create_activity')
    visit('edit_activity')
end

When(/^I click on the select class roster$/) do
    fill_in 'activity_roster', :with => string
end

And(/^there is no roster$/) do
     selected 'activity_roster'
end 

Then(/^I can create a class roster$/) do 
     fill_in 'activity_roster', :with => string
end