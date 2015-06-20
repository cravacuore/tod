Feature: Set the amount of evaluations for a proposal

  Background:
    Given an admin user

  Scenario: admin user do not set an amount of evaluations for proposals
    When  an admin user visits admin page
    Then  amount of evaluations required should display 3 as default

  Scenario: admin user sets an amount of evaluations for proposals
    When  an admin user visits admin page
    And   changes the amount of evaluations for a proposal to 4
    Then  a success message is displayed with quantity 4