Feature: Show proposal visits number 

Background:
  Given a regular user
  And   a proposal with "3" visits

Scenario: regular user increments proposal detail visits
  When user visits proposal list
  Then should see proposal listed with "3" visits
  When user enters proposal details
  Then should see proposal with "4" visits

Scenario: regular user increments proposal list visits
  When user visits proposal list
  Then should see proposal listed with "3" visits
  When user enters proposal details
  And  user visits proposal list
  Then should see proposal listed with "4" visits