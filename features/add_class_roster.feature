Feature: Add Class Roster
	As a professor
	I want to be able to specify who is eligible for an activity	
    So that I can provide rewards to students in my class

Scenario: select a class roster
	Given I am on the create activity page
	When I click on the select class roster
	Then the roster is selected

Scenario: edit which class roster is eligible
	Given I am on the edit activity page
	When I click on the select class roster
	Then I can edit the class roster that is selected
	
Scenario: there is no class roster
    Given I am on the create activity page or the edit activity page
    When I click on the select class roster
    And there is no roster
    Then I can create a class roster

