Feature: Eliminar usuario

  Background:
    * url 'https://gorest.co.in/public/v2/'
    * def pathUsuario = 'users/7519164'
    * def tokenUsuario = 'Bearer 083115bf02241ca23b6b12587360d7f3c5d79026aebce800214062f924e33d03'

  Scenario: Eliminacion de un usuario
    Given path pathUsuario
    And header authorization = tokenUsuario
    When method Delete
    Then status 204