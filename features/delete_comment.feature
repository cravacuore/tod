Feature: admin delete comments

  Background:
    Given an admin user
    And    a proposal with "un comentario" comment

  Scenario: admin user can delete the comment
    When admin user visits the proposals list
    And    enters the details of the proposal
    And    click on the delete button of comment "un comentario"
    Then  it should display "Comentario eliminado"
    And    comment "un comentario" should not appear

  Scenario: regular user cannot delete the comment
    When regular user visits the proposals list
    And    enters the details of the proposal
    And    click on the delete button of comment "un comentario"
    Then  it should display "No tienes permisos para eliminar comentarios"

  Scenario: revisor user cannot delete the comment
    When   revisor user visits the proposals list
    And    enters the details of the proposal
    And    click on the delete button of comment "un comentario"
    Then  it should display "No tienes permisos para eliminar comentarios"