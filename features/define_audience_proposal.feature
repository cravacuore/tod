Feature: Define the audience’s level to a proposal

  Background:
    Given an author user

  Scenario: define audience "Inicial"
    When an user creates a proposal
    And    selects "Inicial" as audience’s type
    And    submits
    Then  audience’s type for proposal should be "Inicial"

  Scenario: define audience "Practicante"
    When an user creates a proposal
    And    selects "Practicante" as audience’s type
    And    submits
    Then  audience’s type for proposal should be "Practicante"

  Scenario: define audience "Avanzada"
    When an user creates a proposal
    And    selects "Avanzada" as audience’s type
    And    submits
    Then  audience’s type for proposal should be "Avanzada"