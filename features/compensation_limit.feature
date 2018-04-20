Feature: Compensation Limit
  As an admin
  I want to limit the amount of compensation that can be earned
  So that this app costs less money
  
 Scenario: User tries to set compensation
   Given I am setting compensation to 600
   Then compensation should be 500
   
   Given I am setting compensation to 300
   Then compensation should be 300