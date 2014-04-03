Feature: User
  In order to create .bib files
  As a user
  I want to be able to login to the system

  Scenario: Create user
    Given I am on the user creation page
    And I have entered username and password
    When I click Create User
    Then I should see User was successfully created.

  Scenario: Login
    Given I am on the login page
    And I have entered a valid username and password
    When I click Login
    Then I should see Logged in

  Scenario: Logout
    Given I am logged in as a user
    When I click Logout
    Then I should see Logged out