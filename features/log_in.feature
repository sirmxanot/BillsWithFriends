Feature: Existing User Log In
  In order to gain access to my account
  As an existing user
  I want to log in to the application

  Scenario: Visit Log In Page
    When I visit the log in page
    Then I should see the words "Log In"
    And I should see a link to Log Up
    And I should see a link to Forgot Your Password?

  Scenario: Successful Log In
    When I enter valid information for all log in fields
    And I click "Log In"
    Then I should be redirected to the Summary Page
    And I should see a message stating that I logged in successfully

  Scenario: Missing Email Address
    When I leave the email address field blank
    And I click "Log In"
    Then I should see a message stating email address can't be blank

  Scenario: Missing Password
    When I leave the password field blank
    And I click "Log In"
    Then I should see a message stating password can't be blank

  Scenario: Invalid Email Address
    When I enter an email address that is not in the system
    And I click "Log In"
    Then I should see a message stating invalid email or password

  Scenario: Invalid Password
    When I enter an incorrect password
    And I click "Log In"
    Then I should see a message stating invalid email or password