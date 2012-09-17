Feature: Kiji for logged in user
  In order to learn new thing and discuss about it with others
  As one who reads kiji
  I want to read a great kiji per day and discuss with others

  Background:
    Given a logged in user
    And a user with following data:
      | key           | value                 |
      | username     | chibicode             |
    And today's kiji submitted by "chibicode" with following data:
      | key           | value                 |
      | title         | Hitokiji is launched! |
      | href          | http://hitokiji.com   |

  Scenario: View a single kiji
    When I go to the home page
    Then the page should display a title "Hitokiji is launched!"
    And the page should display a submitter's name "chibicode"

  Scenario: View comments for a single kiji
    Given a user with following data:
      | key           | value                 |
      | username     | kn                    |
    And a comment made by "kn" with following data:
      | key           | value                 |
      | text          | Congrats!             |
    When I go to the home page
    Then the page should display a comment "Congrats!"
    And the page should display a commenter's name "kn"
    And the page should display the number of comments "1 comment"

  Scenario: Add a comment on a single kiji
    Given I go to the home page
    When I fill in "What's this?" for "text" of "comment" form
    And I press "Add comment"
    Then user's comment should be created with following data:
      | key           | value                 |
      | text          | What's this?          |
    And the page should display a comment "What's this?"

  Scenario: Reply to a comment
    Given a user with following data:
      | key           | value                 |
      | username     | kn                    |
    And a comment made by "kn" with following data:
      | key           | value                 |
      | text          | Congrats!             |
    And I go to the home page
    When I press "Reply..."
    And I fill in "Thanks!" for "text" of "reply" form
    And I press "Reply"
    Then user's comment should be created with following data:
      | key           | value                 |
      | text          | Thanks!               |
    And the page should display a comment "Thanks!"
