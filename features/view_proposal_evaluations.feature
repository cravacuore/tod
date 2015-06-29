Feature: View evaluations from a evaluated proposal

Background:
  Given a revisor user
  And   a proposal evaluated by that user
  And   a proposal not evaluated by that user

Scenario: revisor user should see evaluation
  When revisor user visits the details for a proposal he did evaluate
  Then he should see "Ver Evaluaciones" button
  And  clicks on "Ver Evaluaciones" button
  Then he should see the proposal evaluations

Scenario: revisor user should not see evaluations
  When revisor user visits the details for a proposal he didn't evaluate
  Then he should see "Ver Evaluaciones" button
  And  clicks on "Ver Evaluaciones" button
  Then should see "Aún no has evaluado esta propuesta"
