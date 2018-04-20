Given (/^I am an administrator at the select activity page$/) do
  visit('/users/sign_in')
  User.new(:email => "create_activities@account", :password => "modtest", :password_confirmation => "modtest").save!
  fill_in 'user_email', :with => 'create_activities@account'
  fill_in 'user_password', :with => 'modtest'
  find('[name=commit]').click
end

When(/^I click add an activity$/) do
  visit('/activities/new')
end

When (/^(?:|I )select datetime "([^ ]*) ([^ ]*) ([^ ]*) - ([^:]*):([^"]*)" as the "([^"]*)" in the create activity prompt$/) do |year, month, day, hour, minute, field|
  select(year,   :from => "#{field}_1i")
  select(month,  :from => "#{field}_2i")
  select(day,    :from => "#{field}_3i")
  select(hour,   :from => "#{field}_4i")
  select(minute, :from => "#{field}_5i")
end
When("enter {string} as the title") do |string|
  fill_in 'activity_title', :with => string
end
When (/^I click enter$/) do
    find('[name=commit]').click
end
Then("The activity should be created") do
  expect(Activity.find(1).owner_ID == 1)
end
Then("The activity should not be created") do
  expect(Activity.where(id: 1).nil?)
end