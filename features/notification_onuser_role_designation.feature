Feature: Receive notifications when changing user role

  Background:
    Given an admin user
    And   a regular user
    And   a user with revisor permission

  @javascript
  Scenario: admin designates revisor role to regular user
    When admin designates regular user as revisor
    Then  he should see a role designated notification

  @javascript
  Scenario: admin revokes revisor role from revisor user
    When admin removes revisor privileges from user
    Then  he should see a role revoked notification
