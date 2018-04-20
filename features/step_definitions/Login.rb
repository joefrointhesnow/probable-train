Given(/^I am on the login page$/) do
  visit('/users/sign_out') #verify signed out before start
  visit('/users/sign_in') #visit sign in page 
  User.new(:email => "test@test.com", :password => "testtest", :password_confirmation => "testtest").save!
end

When(/^I enter a valid username$/) do
  testUsername = "test@test.com"
  fill_in "user_email", :with => testUsername
end

When(/^I enter a valid password$/) do
  testPassword = "testtest"
  fill_in "user_password", :with => testPassword
end

Then(/^I should be directed to the the Choose Activity screen$/) do
  click_button "Log in"
  expect(page).to have_current_path(root_url, url: true)
end
  
When(/^I enter an invalid username$/) do
   visit('/users/sign_out') #verify signed out before start
   visit('/users/sign_in') #visit sign in page 
   fill_in "user_email", :with => "badusername"
end

When(/^I have clicked the submit button$/) do
   click_button "Log in"
end

Then(/^I should be notified of a failed login$/) do
   expect(page).to have_current_path('/users/sign_in', url: false)
end
   When(/^I enter a invalid password$/) do
   fill_in "user_password", :with => "badusername"
end

When(/^I click the New User button$/) do
   visit('/users/sign_out') #verify signed out before start
   visit('/users/sign_in') #visit sign in page   
   click_link "Sign up"
end

Then(/^I should be on the New User page$/) do
   expect(page).to have_current_path('/users/sign_up', url:false)
end
