Feature: Consultar usuario

  Background:
    * url 'https://gorest.co.in/public/v2'
    * def pathUser = '/users/6942398'

  Scenario: Consulta usuario en Go REST
    Given path pathUser
    When method GET
    Then status 200