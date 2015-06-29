Feature: Evaluate a proposal

Background:
  Given a revisor user
  And   a proposal he did not evaluate yet

# seleccion de dictamenes con un dropdown
Scenario: revisor evaluates a proposal with opinion Aceptación Débil
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on "Evaluar" button
  Then should see evaluation form
  When evaluates it with opinion "Aceptación Débil"
  And  leaves a valid comment
  When submitting
  Then evaluation confirmation with opinion "Aceptación Débil" is displayed

Scenario: revisor evaluates a proposal with opinion Aceptación Fuerte
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on "Evaluar" button
  Then should see evaluation form
  When evaluates it with opinion "Aceptación Fuerte"
  And  leaves a valid comment
  When submitting
  Then evaluation confirmation with opinion "Aceptación Fuerte" is displayed

Scenario: revisor evaluates a proposal with opinion Rechazo Débil
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on "Evaluar" button
  Then should see evaluation form
  When evaluates it with opinion "Rechazo Débil"
  And  leaves a valid comment
  When submitting
  Then evaluation confirmation with opinion "Rechazo Débil" is displayed

Scenario: revisor evaluates a proposal with opinion Rechazo Fuerte
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on "Evaluar" button
  Then should see evaluation form
  When evaluates it with opinion "Rechazo Fuerte"
  And  leaves a valid comment
  When submitting
  Then evaluation confirmation with opinion "Rechazo Fuerte" is displayed

# cantidad de palabras minimas en el comentario = 3

Scenario: revisor evaluates a proposal and leaves a three words comment
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on "Evaluar" button
  Then should see evaluation form
  When evaluates it with opinion "Aceptación Fuerte"
  And  comments it with comment "This is valid"
  When submitting
  Then evaluation confirmation with opinion "Aceptación Fuerte" is displayed

Scenario: failing evaluation, revisor leaves a two words comment
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on "Evaluar" button
  Then should see evaluation form
  When evaluates it with opinion "Rechazo Fuerte"
  And  comments it with comment "This not"
  When submitting
  Then should see "El campo Comentario tiene menos de 3 palabras"

Scenario: failing evaluation, revisor leaves an empty comment
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on "Evaluar" button
  Then should see evaluation form
  When evaluates it with opinion "Rechazo Fuerte"
  And  comments it with comment ""
  When submitting
  Then should see "El campo Comentario tiene menos de 3 palabras"

# revisiones multiples de una propuesta

Scenario: revisor user cannot evaluate a proposal multiple times
  When a revisor user visit proposal list
  And  selects a proposal
  And  evaluates proposal
  And  selects the same proposal
  When clicks on "Evaluar" button
  Then should see "Ya has evaluado esta propuesta"

