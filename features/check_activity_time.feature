Feature:
  As a student
  So that I can view my accumulated time in an activity
  I want to check my accumulated points
  
Scenario: A student checks how many points they've accumulated in an activity
  Given I am a member of an activity
  When I visit the earnings page
  Then I should see the activity title and points earned so far
  
Scenario: A student checks how many points the have on an activity they have not attended
  Given I am a member of an activity
  When I visit the earnings page
  Then I should see no points next to
