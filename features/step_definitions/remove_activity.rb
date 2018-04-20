Given("I am logged in with intent to delete") do 
  visit('/users/sign_out') #verify signed out before start
  visit('/users/sign_in') #visit sign in page 
  User.new(:email => "test@test.com", :password => "testtest", :password_confirmation => "testtest").save!
  Activity.new(:title => 'test activity', :startTime => '10:00', :duration => 75, :owner_ID => '1').save!
  testUsername = "test@test.com"
  fill_in "user_email", :with => testUsername
  testPassword = "testtest"
  fill_in "user_password", :with => testPassword
  click_button "Log in"
  expect(page).to have_current_path(root_url, url: true)
end

Given("I see an activity") do
    within("body") do
      page.should have_content("test activity")
    end
end

When("I click on more info for the activity") do
  visit ('/activities/1')
  within("body") do
    expect(page).to have_content('Delete')
  end
end

When("I click on the delete button") do
  click_on('Delete')
end

Then("I should be on the select activity page") do
  expect(page).to have_current_path('/activities/select_activity', url: false)
end

Then("I should not see the activity") do
  within("body") do
    page.should have_no_content("test activity")
  end
end