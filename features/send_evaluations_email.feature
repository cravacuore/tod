Feature: Poder enviar resultados al autor de una propuesta con al menos tres revisiones

  Background:
    Given an admin user
    And a proposal "A" with 3 revisions
    And a proposal "B" with 2 revisions

  @javascript
  Scenario:  the proposal does have three revisions and should show "notificar resultado" button
    When an admin user visits proposal "A" details
    Then  should see the "Notificar resultado" button
    When clicks on  "Notificar resultado" button
    Then  it should display  "Mail enviado correctamente"

  @javascript
  Scenario: the proposal does have two revisions but should not show "notificar resultado" button
    When an admin user visits proposal "B" details
    Then  should not see the "Notificar Resultado" button

  @javascript
  Scenario:  Notification with error message when mail could not be sent
    When an admin user visits proposal "A" details
    Then  should see the "Notificar resultado" button
    When  mailing does not work
    And   clicks on  "Notificar resultado" button
    Then  it should display  "Acción no completada"