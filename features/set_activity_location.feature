Feature: Set Activity Locations
	As a professor
	I want to be able to use locations services to create activity locations
	So that I can verify if students are present at an activity

  
Scenario: A teacher wants to change the location of an activity
  Given I am an administrator and have a previously created activity
  When I visit an activity's edit page
  When I change the activity's location
  Then I should see the activity's location updated on the index page
