Feature: Modify Activity Time
	As an administrator
	I want to be able to modify at which times students get credit for an activity
	So that I can adjust scheduling to meet class needs


Scenario: An administrator changes the meeting times for an existing activity
    Given I have an existing activity I created 1
    When I click edit on an activity
    When I select datetime "2018 April 20 - 12:00" as the "activity_startTime" in the prompt and click enter
    Then The activity time should be updated
    
Scenario: An administrator changes the meeting times for an activity they do not own
    Given I am not the owner of an activity
    When I try to edit someone else's activity
    Then I should be directed back to the index page
