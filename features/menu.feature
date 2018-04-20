Feature: menu
	As any user
        I want to be able to use the menu for navigation
        So that i can access parts of the site and sign out

Scenario: Logging out of the Cash for Class website
	Given I am logged in
	When I click the Log Out button
        Then I should be signed out

Scenario: Navigate to the Student Earning page
	Given I am logged in
	When I click the Student Earning button
	Then I should be on the Student Earning page

Scenario: Navigate to the Select Activity page
	Given I am logged in
	And I am not on the Select Activity page
	When I click the Select Activity button
	Then I should be on the Select Activity page
