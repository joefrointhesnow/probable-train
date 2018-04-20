Feature: Create Activity
	As a professor
	I want to be able to create activities
	So that I can assign and manage activities for a class

Scenario: An administrator creates a new activity
    Given I am an administrator at the select activity page
    When I click add an activity
    When I select datetime "2018 April 20 - 12:00" as the "activity_startTime" in the create activity prompt 
    When enter "test activity" as the title
    When I click enter
    Then The activity should be created

Scenario: An administrator tries to create a new activity but is unsuccessful
    Given I am an administrator at the select activity page
    When I click add an activity
    When I select datetime "2018 April 20 - 12:00" as the "activity_startTime" in the create activity prompt 
    When I click enter
    Then The activity should not be created
