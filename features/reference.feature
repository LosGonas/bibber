Feature: Reference
  In order to have content in .bib files
  As a user
  I want to store and export references from the system

  Scenario: List all references
    Given I am on start page
    When I click All references
    Then I should see a list of all references in the system

  Scenario: Show reference details
    Given I am on the all references page
    And There are some references in the system
    When I click Show on a reference
    Then I should see info about that reference

  Scenario: Create reference
    Given I am logged in as a user
    And I am on the new page
    When I fill the required fields
    Then I should see message of success

  Scenario: Edit reference
    Given I am logged in as a user
    And I am on all references page
    When I click Edit on a reference
    Then I should be able to edit info
    And save changes

  Scenario: Delete reference
    Given I am logged in as a user
    And I am on all references page
    When I click Destroy
    Then I should not see that reference