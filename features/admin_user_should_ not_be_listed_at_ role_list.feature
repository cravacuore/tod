Feature: Admin user should not be listed at Role Assignation section list

  Scenario: admin user should not be listed
    Given an admin user
    When visit role assignation page
    Then  his name should not be listed
