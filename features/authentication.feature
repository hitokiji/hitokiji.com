Feature: Authentication
  In order to submit kiji and comment
  Visitors to the web application
  Should be able to signup, login and logout

  Scenario: Signup
    Given I go to the signup page
    When I fill in the following:
      | Username          | chibicode               |
      | Email             | chibicode@hitokiji.com  |
      | Password          | 12345                   |
      | Confirm Password  | 12345                   |
    And I press "Sign up"
    Then I should be redirected to the home page
    And the page should display "Logout" button

  Scenario: Login
    Given I go to the login page
    When I fill in the following:
      | Username          | steve                   |
      | Password          | 12345                   |
    And I press "Login"
    Then I should be redirected to the home page
    And the page should display "Logout" button

  Scenario: Logout
    Given a logged in user
    And I go to the home page
    When I press "Logout"
    Then I should be redirected to the home page
    And the page should display "Login" button
