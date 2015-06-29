Feature: Proposals Quantity Report

  Background:
    Given a revisor user
    Given there are 5 proposals

  Scenario: revisor user can see report section
    When a revisor user visits reports url
    Then reports page is displayed

  Scenario: revisor user can see quantity report
    When a revisor user visits reports page
    And  selects quantity report
    Then quantity report is displayed with quantity 5

  Scenario: non revisor user cannot see report section
    When a non-revisor user visits reports page
    Then a not-found page is displayed
