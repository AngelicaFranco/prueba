Feature: practica conduit Put

  Background:
    * url 'https://conduit-realworld-example-app.fly.dev'
    * def pathEditar = 'api/user'
    * def tokenUsuario = 'Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlBydWViYXMiLCJlbWFpbCI6InBydWViYXMxODRAZ21haWwuY29tIiwiaWF0IjoxNzI4MTYwMDIwfQ.jAaqtttJuXXjEVy5-Q_WIbfGrySYrWc9HbjT4qdEQE0'

  Scenario: validar peticion PUT
    Given path pathEditar
    And header Authorization = tokenUsuario
    And request
      """
      {
    "user": {
        "bio": "Sara Jimenez",
        "email": "pruebas184@gmail.com",
        "image": "",
        "password": "",
        "username": "Angelica"
           }
      }
      """
    When method PUT
    Then status 200
    And assert response.user.bio == 'Sara Jimenez'
