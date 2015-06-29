Feature: Login with Linkedin

  Background:
    Given a user with a valid linkedin user

  Scenario: Login with my LinkedIn account
    When  visits the login page
    And   selects login with linkedin
    Then  user should be logged in