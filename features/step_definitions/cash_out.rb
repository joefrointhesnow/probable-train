Given(/^I am on the earning_student page$/) do
    visit('/earning_student')
end

When(/^I click on the cash out button$/) do
    click_button "CASH OUT"
    expect(page).to have_current_path('/earning_student/cash_out', url: false)
end

Then(/^an email should be sent to the user and the administrator$/) do
    expect(page).to have_current_path('/earning_student/cash_out', url: false) 
end

And(/^I should be redirected to the cash_out page with a message$/) do 
    page.should.have_content("A confirmation number has been sent to your email with further instructions.")
end

Given(/^I am on the earning cash page$/) do
    visit('/earning_student')
end

When(/^click on the cash out button$/) do
    click_button "CASH OUT"
    expect(page).to have_current_path('/earning_student/cash_out', url: false)
end

Then(/^it says email could not be sent and confirmation number as a result is not generated$/) do
    page.should.have_content('Email was not sent')
end