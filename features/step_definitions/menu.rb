Given("I am logged in") do
  visit('/users/sign_out') #verify signed out before start
  visit('/users/sign_in') #visit sign in page 
  User.new(:email => "test@test.com", :password => "testtest", :password_confirmation => "testtest").save!
  testUsername = "test@test.com"
  fill_in "user_email", :with => testUsername
  testPassword = "testtest"
  fill_in "user_password", :with => testPassword
  click_button "Log in"
  expect(page).to have_current_path(root_url, url: true)
end

When("I click the Log Out button") do
  page.should have_selector(:link_or_button, 'Log Out')
  click_link "Log Out"
end

Then("I should be signed out") do
  expect(page).to have_current_path('/users/sign_in', url: false)
end

When("I click the Student Earning button") do
  expect(page).to have_current_path(root_url, url:true)
  click_link "Other Stuff"
  click_link "Student Earning"
#  page.find(:xpath, "//a[@href='/activity/earning_student']").click  
#find('navbar').click
#  find(:css, 'dropdown-menu option', :text => 'Student Earning').click  

end

Then("I should be on the Student Earning page") do
  expect(page).to have_current_path('/activities/earning_student', url:false)
end

Given("I am not on the Select Activity page") do
  visit('/activities/earning_student')
  expect(page).to_not have_current_path('/')
end

When("I click the Select Activity button") do
  expect(page).to_not have_current_path(root_url, url:true)
  click_link "Other Stuff"
  click_link "Home"

end

Then("I should be on the Select Activity page") do
  expect(page).to have_current_path(root_url, url:true)
end
