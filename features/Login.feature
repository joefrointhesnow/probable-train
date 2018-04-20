Feature: Login
	As a student or professor or administrator
	I want to be able to log in to my account
	So that I can access my specific data

Scenario: Logging into the Cash For Class Website
	Given I am on the login page
	When I enter a valid username
	And I enter a valid password
	Then I should be directed to the the Choose Activity screen

Scenario: Failed logging into the Cash for Class Website with invalid username
	Given I am on the login page
	When I enter an invalid username
	And I have clicked the submit button
	Then I should be notified of a failed login

Scenario: failed loggin into the Cash for Class website with invalid password
	Given I am on the login page
	When I enter a valid username
	And I enter a invalid password
	Then I should be notified of a failed login 

Scenario: Create New User
	Given I am on the login page
	When I click the New User button
	Then I should be on the New User page

