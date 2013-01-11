Feature: Logged In User Log Out
  In order to end my current session
  As a logged in user
  I want to log out of the application

  Scenario: Successfully Log Out
    Given I am currently logged in to the application
    And I am on the summary page
    And I click the "Log Out" link
    Then I am redirected to the log in page
    And I should see a message that I have signed out successfully