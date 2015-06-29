Feature: Proposal type

  Background:
    Given an author user

  Scenario: author selects presentation for his proposal
    When an author creates a proposal
    And   he selects "Presentación" as sessions type
    And   submits
    Then  sessions type for proposal should be "Presentación"

  Scenario: author selects "taller" for his proposal
    And   he selects "Taller" as sessions type
    And   submits
    Then  sessions type for proposal should be "Taller"