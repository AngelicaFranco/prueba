Feature: Practica de union de features

  Background:
    * url 'https://conduit-realworld-example-app.fly.dev'

  @Eliminar

  Scenario: Eliminacion de un articulo
    Given path pathArticulos + '/' + titulo
    And header authorization = tokenUsuario
    When method Delete
    Then status 200