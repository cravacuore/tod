Feature: Evaluate a proposal

Background:
  Given a revisor user
  And   a proposal he did not evaluate yet

Scenario: revisor evaluates a proposal with opinion 'Aceptación Debil'
  When a revisor user visit proposal list
  And  selects a proposal
  And  evaluates it with opinion "Aceptación Débil"
  And  leaves a valid comment
  Then evaluation confirmation with opinion "Aceptación Débil" should be displayed

Scenario: revisor evaluates a proposal with opinion "Rechazo Debil"
  When a revisor user visit proposal list
  And  selects a proposal
  And  evaluates it with opinion "Rechazo Débil"
  And  leaves a valid comment
  Then evaluation confirmation with opinion "Rechazo Débil" should be displayed

Scenario: revisor evaluates a proposal with opinion "Aceptación Fuerte"
  When a revisor user visit proposal list
  And  selects a proposal
  And  evaluates it with opinion "Aceptación Fuerte"
  And  leaves a valid comment
  Then evaluation confirmation with opinion "Aceptación Fuerte" should be displayed

Scenario: revisor evaluates a proposal with opinion "Rechazo Fuerte"
  When a revisor user visit proposal list
  And  selects a proposal
  And  evaluates it with opinion "Rechazo Fuerte"
  And  leaves a valid comment
  Then evaluation confirmation with opinion "Rechazo Fuerte" should be displayed

Scenario: revisor evaluates a proposal when comment has three words
  When a revisor user visit proposal list
  And  selects a proposal
  And  evaluates it with opinion "Rechazo Fuerte"
  And  comments "A great comment"
  Then evaluation confirmation with opinion "Rechazo Fuerte" should be displayed

Scenario: falling evaluates submission when comment has two words
  When a revisor user visit proposal list
  And  selects a proposal
  And  evaluates it with opinion "Rechazo Fuerte"
  And  comments "Poor comment"
  Then it should display "El campo Comentario tiene menos de 3 palabras"

#Scenario: revisor user cannot evaluate a proposal multiple times
#  When a revisor user visit proposal list
#  And  selects a proposal
#  And  evaluates proposal
#  And  visits the proposal detail
#  Then should not be able to evaluate the proposal
