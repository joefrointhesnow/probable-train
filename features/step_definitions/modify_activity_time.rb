Given (/^I have an existing activity I created (\d+)$/) do |id|
  visit('/users/sign_in')
  User.new(:email => "modify_activities@account", :password => "modtest", :password_confirmation => "modtest").save!
  fill_in 'user_email', :with => 'modify_activities@account'
  fill_in 'user_password', :with => 'modtest'
  find('[name=commit]').click
  Activity.new(:title => 'CS3300 - Software Engineering', :startTime => '10:00', :duration => 75, :owner_ID => '1').save!
  Activity.find(id).owner_ID.equal?(1)
end

When(/^I click edit on an activity$/) do
  visit('/activities/1/edit')
end

When (/^(?:|I )select datetime "([^ ]*) ([^ ]*) ([^ ]*) - ([^:]*):([^"]*)" as the "([^"]*)" in the prompt and click enter$/) do |year, month, day, hour, minute, field|
  select(year,   :from => "#{field}_1i")
  select(month,  :from => "#{field}_2i")
  select(day,    :from => "#{field}_3i")
  select(hour,   :from => "#{field}_4i")
  select(minute, :from => "#{field}_5i")
  find('[name=commit]').click
end

Then (/^The activity time should be updated$/) do
  expect(Activity.find(1).startTime).equal?(Time.parse("2016-04-20 12:00:00.0000000"))
end

Given (/^I am not the owner of an activity$/) do
  visit('/users/sign_in')
  User.new(:email => "modify_activities@account", :password => "modtest", :password_confirmation => "modtest").save!
  fill_in 'user_email', :with => 'modify_activities@account'
  fill_in 'user_password', :with => 'modtest'
  find('[name=commit]').click
  Activity.new(:title => 'CS3300 - Software Engineering', :startTime => '10:00', :duration => 75, :owner_ID => '2').save!
  expect(!(Activity.find(1).owner_ID.equal?(1)))
end

When(/^I try to edit someone else's activity$/) do
  Activity.new(:title => 'CS3300 - Software Engineering', :startTime => '10:00', :duration => 75, :owner_ID => '2').save!
  visit('/activities/2/edit')
end

Then (/^I should be directed back to the index page$/) do
  expect(Activity.find(1).startTime).equal?(Time.parse("2016-04-20 12:00:00.0000000"))
end