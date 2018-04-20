Feature: Create Activity code
	As a professor
	I want to be able to create activity login codes
	So that I can manage who can sign into a activity

Scenario: I created an activity and want to view the access code
    Given I am an administrator at the view activity page
    When I view the activities show more info page
    Then I see the current access code
    
Scenario: I created an activity and want to manually change the access code
    Given I am an administrator at the view activity page
    When I view the activities show more info page and type in the code 12345
    Then I see the change access code
    
Scenario: I created an activity and want to randomly generate a new access code
    Given I am an administrator at the view activity page
    When I view the activities show more info page
    Then I see the generate access code
