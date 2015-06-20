Feature: View evaluations from a evaluated proposal

Background:
  Given a revisor user
  And   a proposal evaluated by that user
  And   a proposal not evaluated by that user

#Scenario: revisor user should see evaluation
#  When revisor user visits the proposal list
#  And  enters to a evaluated proposal
#  Then he should see evaluations button
#  When he clicks the evaluations button
#  Then he should see the proposal evaluations
#
#Scenario: revisor user should not see evaluations
#  When revisor user visits the detail for a proposal he didn't evaluate
#  Then he should see the proposal evaluation form
