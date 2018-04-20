Feature: Remove Activity
	As a professor
	I want to be able to remove an activity,
	So that I can clear old and unnecessary activities. 

Scenario: Would like to remove an activity
	Given I am logged in with intent to delete
	And I see an activity
	When I click on more info for the activity
	And I click on the delete button
	Then I should be on the select activity page
	And I should not see the activity


