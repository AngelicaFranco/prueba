Feature: practica conduit post
  Background:
    * url 'https://conduit-realworld-example-app.fly.dev'
    * def pathArticulos = '/api/articles'
    * def tokenUsuario = 'Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlBydWViYXMiLCJlbWFpbCI6InBydWViYXMxODRAZ21haWwuY29tIiwiaWF0IjoxNzI4MTYwMDIwfQ.jAaqtttJuXXjEVy5-Q_WIbfGrySYrWc9HbjT4qdEQE0'

  Scenario: validar peticion POST
    * def numeroDinamico = function(){ return Math.floor(Math.random() * 99999); }
    * def titulo = 'karate' + numeroDinamico()
    Given path pathArticulos
    And header authorization = tokenUsuario
    And request
    """
    {
      "article": {
        "title": "#(titulo)",
        "description": "empresa",
        "body": "negocios",
        "tagList": [
          "enterprise"
        ]
      }
    }
    """
    When method POST
    Then status 201
    * call read('delete.feature@Eliminar')