Feature: Admin login

Scenario: user with admin email logs in as admin
  Given a user with mail "admin@mail.com"
  When  logging in
  Then  he should be logged as admin

Scenario: user without admin email is not logged in as admin
  Given a user with mail "not-admin@mail.com"
  When  logging in
  Then  he should not be logged as admin