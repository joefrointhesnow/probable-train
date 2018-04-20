#Joe was here
Given("I am an administrator at the view activity page") do
  visit('/users/sign_out') #verify signed out before start
  visit('/users/sign_in') #visit sign in page 
  User.new(:email => "test@test.com", :password => "testtest", :password_confirmation => "testtest").save!
  Activity.new(:title => 'test activity', :startTime => '10:00', :duration => 75, :owner_ID => '1', :activeCode => 898989).save!
  testUsername = "test@test.com"
  fill_in "user_email", :with => testUsername
  testPassword = "testtest"
  fill_in "user_password", :with => testPassword
  click_button "Log in"
  
  #visit('/activities/new')
  #fill_in 'activity_title', :with => "TEST"
  #find('[name=commit]').click
  #expect(Activity.find(1).owner_ID == 1)
  
  #page.should have_content("test activity")
  #click_button "test activity"
end

When("I view the activities show more info page") do
  visit ('/activities/1')
  #expect(page).to have_current_path(root_url, url: true)
end

When("I view the activities show more info page and type in the code 12345") do
  visit ('/activities/1')
  #expect(page).to have_current_path(root_url, url: true)
end



Then("I see the current access code") do
  within("body") do
    expect(page).to have_content('Current Code')
    expect(page).to have_content("898989")
  end
  #click_on('Delete')
end

#=======================================================================================================================================



Then("I see the change access code") do
  within("body") do
    expect(page).to have_content('Custom Code')
    find('[name=save]').click
  end
  #click_on('Delete')
end

#=======================================================================================================================================



Then("I see the generate access code") do
  within("body") do
    #expect(page).to have_content("genCode")
    expect(find('[name=genCode]'))
  end
  #click_on('Generate new code')
  #click_on('Delete')
end