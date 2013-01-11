Feature: New User Sign Up
  In order to use the application
  As a new user
  I want to create a user account

  Scenario: Visit Sign Up Page
    When I visit the sign up page
    Then I should see the words "Sign Up"
    And I should see a link to Sign In
    And I should see a link to Forgot Your Password?

  Scenario: Successful Sign Up
    When I enter valid information for all sign up fields
    And I click "Create User"
    Then I should be redirected to the Summary Page
    And I should see a message stating that I signed up successfully
    And I should receive and email stating that I signed up successfully

  Scenario: Missing First Name
    When I leave the first name field blank
    And I click "Create User"
    Then I should see a message stating first name can't be blank

  Scenario: Missing Last Name
    When I leave the last name field blank
    And I click "Create User"
    Then I should see a message stating last name can't be blank

  Scenario: Missing Email Address
    When I leave the email address field blank
    And I click "Create User"
    Then I should see a message stating email address can't be blank

  Scenario: Invalid Email Address
    When I enter an invalid email address
    And I click "Create User"
    Then I should see a message stating email address is invalid

  Scenario: Email Address Already Exists
    When I enter an email address which is already in the system
    And I click "Create User"
    Then I should see a message stating email address already taken

  Scenario: Missing Password
    When I leave the password field blank
    And I click "Create User"
    Then I should see a message stating password can't be blank

  Scenario: Missing Password Confirmation
    When I leave the password confirmation field blank
    And I click "Create User"
    Then I should see a message password confirmation can't be blank

  Scenario: Mismatched Password and Password Confirmation
    When I enter different password and password confirmation
    And I click "Create User"
    Then I should see a message password doesn't match confirmation

  Scenario: Password is Too Short
    When I enter a password that is fewer than 6 characters
    And I click "Create User"
    Then I should see a message password is too short