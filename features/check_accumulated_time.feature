Feature: check accumulated time
    As a student
    I want to know how much time I have accumulated doing activities
    So that I can track my progress each semester
 
Scenario: logged in as a student 
    Given I am logged in as a student with 300 compensation
    And I am on the earning student page
    Then I should see 300 as my accumulated time
    
Scenario: logged in as a student 
    Given I am logged in as a student with maxed compensation
    And I am on the earning student page
    Then I should see 500 as my accumulated time
    And I should see that I am maxed out

Scenario: logged in as an administrator
    Given I am logged in as an administrator
    And I am on the earning_student page
    Then I should not see accumulated time
    
