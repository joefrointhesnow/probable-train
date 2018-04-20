Given("I am logged in as a student with {int} compensation") do |value|
  
  visit('/users/sign_out') #verify signed out before start
  #visit('/users/sign_in') #visit sign in page 
  User.new(:email => "test@test.com", :password => "testtest", :password_confirmation => "testtest", :compensation => value).save!
  testUsername = "test@test.com"
  fill_in "user_email", :with => testUsername
  
  testPassword = "testtest"
  fill_in "user_password", :with => testPassword
  
  click_button "Log in"
  expect(page).to have_current_path(root_url, url: true)
  
end

Given("I am logged in as a student with maxed compensation") do

  User.new(:email => "maxed@test.com", :password => "testtest", :password_confirmation => "testtest", :compensation => 500).save!
  visit('/users/sign_out') #verify signed out before start
  #visit('/users/sign_in') #visit sign in page 
  
  testUsername = "maxed@test.com"
  fill_in "user_email", :with => testUsername
  
  testPassword = "testtest"
  fill_in "user_password", :with => testPassword
  
  click_button "Log in"
  
  expect(page).to have_current_path(root_url, url: true)
end


Given("I am on the earning student page") do
  visit('/activities/earning_student')
  expect(page).to have_current_path('/activities/earning_student', url: false) 
end

Then("I should see {int} as my accumulated time") do |target_value|
  within("body") do
    page.should have_content(target_value)
  end
end

Then("I should see that I am maxed out") do
    within("body") do
      page.should have_content("user at maximum compensation")
    end
end

#this section is not getting done yet.
#we have yet to implement roles.
Given("I am logged in as an administrator") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should not see accumulated time") do
  pending # Write code here that turns the phrase above into concrete actions
end