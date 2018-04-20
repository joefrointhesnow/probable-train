Feature: Check-in and location verification
  As a student
  I want to be able to “Check In” in order to verify my attendance
  So that my time can be tracked

Scenario: User sees location status icon
  Given The user is signed into an activity
  When The app will check the user's location
  And The user is at the activies location
  Then User sees location verified icon

  Given The user is signed into an activity
  When The app will check the user's location
  And The user is not at the activies location
  Then User sees location not verified icon