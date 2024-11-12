Feature: Creación usuario

  Background:
    * url 'https://gorest.co.in/public/v2/'
    * def pathUserNew = 'users'
    * def tokenUsuario = 'Bearer 083115bf02241ca23b6b12587360d7f3c5d79026aebce800214062f924e33d03'

    Scenario: Creacion de usuario exitosa
      Given path pathUserNew
      And header authorization = tokenUsuario
      And request
      """
      {
    "id": 1093224459,
    "name": "Maximus",
    "email": "maximus@qvision.com",
    "gender": "female",
    "status": "active"
}
      """
      When method POST
      Then status 201
