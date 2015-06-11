Feature: Proposals By Tag Report

  Background:
    Given a revisor user
    Given there are 7 proposals with tag "health" only
    Given there are 2 proposals with tag "market" only
    Given there are 3 proposals with tag "environment" and "health"

  Scenario: revisor user filters market proposals
    When a revisor user visits reports page
    And   selects proposals by tag report
    And   selects tag "market"
    Then 2 proposals with tag "market" are listed
    And   quantity report is displayed with quantity 2

  Scenario: revisor user filters health proposals
    When a revisor user visits reports page
    And   selects proposals by tag report
    And   selects tag "health"
    Then 10 proposals with tag "health" are listed
    And  quantity report is displayed with quantity 10

  Scenario: revisor user applies no filter
    When a revisor user visits reports page
    And   selects proposals by tag report
    And   no tag is selected
    Then 12 proposals are listed
    And  quantity report is displayed with quantity 12