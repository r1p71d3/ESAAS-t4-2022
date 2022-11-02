Feature: display and interact with a list of animals

  Background: animals have been added to the database

    Given the following animals exist:
      | name      | animals_type | personality | price | created_at  | updated_at  | breeders_id |
      | Jonathan  | Cat          | Calm        | $300  | 25-Nov-2021 | 1-Oct-2022  | 1           |
      | Alexander | Lizard       | Calm        | $800  | 26-Oct-2021 | 15-Sep-2022 | 2           |
      | Cynthia   | Dog          | Active      | $450  | 14-Jul-2022 | 20-Oct-2022 | 3           |

    And  I am on the animals page
    Then 3 seed animals should exist

  Scenario: displaying animals
    Given I am on the animals page
    Then I should see the following animals: Jonathan, Alexander, Cynthia
    And I should not see the following animals: Hans, Yuki, Ivan

#  Scenario: visiting an animal page
#    Given I am on the animals page
#    When I follow "Jonathan"
#    Then I should see "Animal: Jonathan"
#
#  Scenario: opening edit page and editing
#    Given I am on the breeder details page for "HappyPets"
#    And I follow "Edit"
#    Then I should see "Edit Breeder"
#    When I fill in "Breeder Name" with "PeppyPets"
#    And I fill in "Address" with "NYU"
#    And I press "Update"
#    Then I should see "Breeder was successfully updated."
#    And I should see "PeppyPets"
#    And I should see "NYU"
#    When I follow "Back"
#    Then I should see "PeppyPets"
#
#  Scenario: canceling edit
#    Given I am on the edit breeder page for "HappyPets"
#    When I fill in "Breeder Name" with "PeppyPets"
#    And I fill in "Address" with "NYU"
#    And I follow "Cancel"
#    Then I should not see "Breeder was successfully updated."
#    And I should see "HappyPets"
#    And I should see "New York"
#    And I should not see "PeppyPets"
#    And I should not see "NYU"
#    When I follow "Back"
#    Then I should see "HappyPets"
#    And I should not see "PeppyPets"
#
#  Scenario: deleting breeder
#    Given I am on the breeder details page for "HappyPets"
#    And I follow "Delete"
#    Then I should see "Breeder was successfully destroyed."
#    And I should not see "HappyPets"
#
#  Scenario: creating a new breeder
#    Given I am on the breeders page
#    When I follow "New Breeder"
#    Then I should see "Add a New Breeder"
#    When I fill in "Breeder Name" with "FantastischeHaustiere"
#    And I fill in "Country" with "Germany"
#    And I fill in "Address" with "Berlin"
#    And I press "Submit"
#    Then I should see "Breeder was successfully created."
#    And I should see "FantastischeHaustiere"
#    And I should see "Germany"
#    And I should see "Berlin"
#    When I follow "Back"
#    Then I should see "FantastischeHaustiere"



  