Feature: display and interact with a list of breeders

  Background: breeders have been added to the database

    Given the following breeders exist:
      | name       | country | address  | price | rating | created_at  | updated_at  |
      | HappyPets  | USA     | New York | $$$   | 4.9    | 25-Nov-1992 | 1-Oct-2022  |
      | PawLine    | UK      | London   | $$    | 4.7    | 26-Oct-1984 | 15-Sep-2022 |
      | InuToNeko  | Japan   | Tokyo    | $     | 5.0    | 14-Jul-2002 | 20-Oct-2022 |

    And  I am on the breeders page
    Then 3 seed breeders should exist

#  Scenario: restrict to movies with "PG" or "R" ratings
#    And I check the "PG" checkbox
#  # enter step(s) to check the "PG" and "R" checkboxes
#    When I check the following ratings: PG, R
#  # enter step(s) to uncheck all other checkboxes
#    When I uncheck the following ratings: G, PG-13
#  # enter step to "submit" the search form on the homepage
#    When I press "ratings_submit"
#  # enter step(s) to ensure that PG and R movies are visible
#    Then I should see the following movies: Amelie, Raiders of the Lost Ark, The Incredibles, The Terminator, When Harry Met Sally
#  # enter step(s) to ensure that other movies are not visible
#    Then I should not see the following movies: 2001: A Space Odyssey, Aladdin, Chicken Run, Chocolat, The Help

  Scenario: displaying breeders
  # your steps here
    Given I am on the breeders page
    Then I should see the following breeders: HappyPets, PawLine, InuToNeko
    And I should not see the following breeders: PeppyPets, ClawLine, NekoToInu

  Scenario: visiting a breeder page
    Given I am on the breeders page
    When I follow "HappyPets"
    Then I should be on the breeder details page for "HappyPets"