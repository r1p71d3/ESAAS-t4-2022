Feature: display and interact with a list of breeders

  Background: breeders have been added to the database

    Given the following breeders exist:
      | name       | country | address  | price | rating | created_at  | updated_at  |
      | HappyPets  | USA     | New York | $$$   | 4.9    | 25-Nov-1992 | 1-Oct-2022  |
      | PawLine    | UK      | London   | $$    | 4.7    | 26-Oct-1984 | 15-Sep-2022 |
      | InuToNeko  | Japan   | Tokyo    | $     | 5.0    | 14-Jul-2002 | 20-Oct-2022 |

    And  I am on the breeders page
    Then 3 seed breeders should exist

  Scenario: displaying breeders
    Given I am on the breeders page
    Then I should see the following breeders: HappyPets, PawLine, InuToNeko
    And I should not see the following breeders: PeppyPets, ClawLine, NekoToInu

  Scenario: visiting a breeder page
    Given I am on the breeders page
    When I follow "HappyPets"
    Then I should see "Breeder: HappyPets"

  Scenario: opening edit page and editing
    Given I am on the breeder details page for "HappyPets"
    And I follow "Edit"
    Then I should see "Edit Breeder"
    When I fill in "Breeder Name" with "PeppyPets"
    And I fill in "Address" with "NYU"
    And I press "Update"
    Then I should see "Breeder was successfully updated."
    And I should see "PeppyPets"
    And I should see "NYU"
    When I follow "Back"
    Then I should see "PeppyPets"

  Scenario: canceling edit
    Given I am on the edit breeder page for "HappyPets"
    When I fill in "Breeder Name" with "PeppyPets"
    And I fill in "Address" with "NYU"
    And I follow "Cancel"
    Then I should not see "Breeder was successfully updated."
    And I should see "HappyPets"
    And I should see "New York"
    And I should not see "PeppyPets"
    And I should not see "NYU"
    When I follow "Back"
    Then I should see "HappyPets"
    And I should not see "PeppyPets"

  Scenario: deleting breeder
    Given I am on the breeder details page for "HappyPets"
    And I follow "Delete"
    Then I should see "Breeder was successfully destroyed."
    And I should not see "HappyPets"

  Scenario: creating a new breeder
    Given I am on the breeders page
    When I follow "New Breeder"
    Then I should see "Add a New Breeder"
    When I fill in "Breeder Name" with "FantastischeHaustiere"
    And I fill in "Country" with "Germany"
    And I fill in "Address" with "Berlin"
    And I press "Submit"
    Then I should see "Breeder was successfully created."
    And I should see "FantastischeHaustiere"
    And I should see "Germany"
    And I should see "Berlin"
    When I follow "Back"
    Then I should see "FantastischeHaustiere"



  