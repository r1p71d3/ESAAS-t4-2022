Feature: display and interact with a list of animals

  Background: animals have been added to the database

    Given the following animals exist:
      | name      | animal_type  | breed            | price | anticipated_birthday | breeder_id |
      | Jonathan  | Cat          | Ragdoll          | 300   | 2023-09-01           | 1          |
      | Alexander | Lizard       | Golden Retriever | 800   | 2023-09-01           | 1          |
      | Cynthia   | Dog          | Husky            | 450   | 2023-09-01           | 1          |

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
    And I should see "Ragdoll"

  Scenario: opening edit page and editing
    Given I am on the animal details page for "Jonathan"
    And I follow "Edit"
    Then I should see "Edit Animal"
    When I fill in "Animal Name" with "Hans"
    And I fill in "Price" with "550"
    And I press "Submit"
    Then I should see "Animal was successfully updated."
    And I should see "Hans"
    And I should see "550"
    When I follow "Back"
    Then I should see "Hans"

  Scenario: canceling edit
    Given I am on the animal details page for "Jonathan"
    And I follow "Edit"
    Then I should see "Edit Animal"
    When I fill in "Animal Name" with "Hans"
    And I fill in "Animal Type" with "Fish"
    And I follow "Cancel"
    Then I should not see "Animal was successfully updated."
    And I should see "Jonathan"
    And I should see "Cat"
    And I should not see "Hans"
    And I should not see "Fish"
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
    When I fill in "Animal Name" with "Good Morning"
    And I fill in "Animal Type" with "Frog"
    And I fill in "Animal Breed" with "Goldfish"
    And I fill in "Price" with "150"
    And I fill in "Anticipated Birthday" with "2023-09-01"
    And I fill in "Breeder id" with "1"
    And I press "Submit"
    Then I should see "Animal was successfully created."
    And I should see "Good Morning"
    And I should see "Frog"
    And I should see "Goldfish"
    When I follow "Back"
    Then I should see "Good Morning"