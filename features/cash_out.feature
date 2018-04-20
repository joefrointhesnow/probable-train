Feature: Cash Out
	As a student
	I want to “Cash Out” the time I have banked
	So that I can receive a reward

Scenario: User would like to cash out to earn cash
	Given I am on the earning cash page
	When I click on the cash out button
	Then an email should be sent to the user and the administrator
	And I should be redirected to the cash_out page with a message

Scenario: Email was not sent and confirmation number not generated
	Given I am on the earning cash page
	When click on the cash out button
	Then it says email could not be sent and confirmation number as a result is not generated
