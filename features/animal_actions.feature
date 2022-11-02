Feature: display and interact with a list of animals

  Background: animals have been added to the database

    Given the following animals exist:
      | name      | animal_type  | personality | price | created_at  | updated_at  | breeders_id |
      | Jonathan  | Cat          | Calm        | $300  | 25-Nov-2021 | 1-Oct-2022  | 1           |
      | Alexander | Lizard       | Calm        | $800  | 26-Oct-2021 | 15-Sep-2022 | 2           |
      | Cynthia   | Dog          | Active      | $450  | 14-Jul-2022 | 20-Oct-2022 | 3           |

    And  I am on the animals page
    Then 3 seed animals should exist

  Scenario: displaying animals
    Given I am on the animals page
    Then I should see the following animals: Jonathan, Alexander, Cynthia
    And I should not see the following animals: Hans, Yuki, Ivan

  Scenario: visiting animal's page
    Given I am on the animals page
    When I follow "Jonathan"
    Then I should see "Animal: Jonathan"
    And I should see "Calm"

  Scenario: opening edit page and editing
    Given I am on the animal details page for "Jonathan"
    And I follow "Edit"
    Then I should see "Edit Animal"
    When I fill in "Animal Name" with "Hans"
    And I fill in "Price" with "$550"
    And I press "Update"
    Then I should see "Animal was successfully updated."
    And I should see "Hans"
    And I should see "$550"
    When I follow "Back"
    Then I should see "Hans"

  Scenario: canceling edit
    Given I am on the animal details page for "Jonathan"
    And I follow "Edit"
    Then I should see "Edit Animal"
    When I fill in "Animal Name" with "Hans"
    And I fill in "Price" with "$550"
    And I follow "Cancel"
    Then I should not see "Animal was successfully updated."
    And I should see "Jonathan"
    And I should see "$300"
    And I should not see "Hans"
    And I should not see "$550"
    When I follow "Back"
    Then I should see "Jonathan"

  Scenario: deleting animal
    Given I am on the animal details page for "Jonathan"
    And I follow "Delete"
    Then I should see "Animal was successfully destroyed."
    And I should not see "Jonathan"

  Scenario: adding a new animal
    Given I am on the animals page
    When I follow "New Animal"
    Then I should see "Add a New Animal"
    When I fill in "Animal Name" with "Hans"
    And I fill in "Animal Type" with "Frog"
    And I fill in "Animal Personality" with "Active"
    And I fill in "Price" with "$150"
    And I press "Submit"
    Then I should see "Animal was successfully created."
    And I should see "Hans"
    And I should see "Frog"
    And I should see "Active"
    When I follow "Back"
    Then I should see "Hans"