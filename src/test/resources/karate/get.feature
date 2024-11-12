Feature: practica conduit get simple

  Background:
    * url 'https://conduit-realworld-example-app.fly.dev'
    * def pathArticulos = '/api/articles'
    * def tokenUsuario = 'Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlBydWViYXMiLCJlbWFpbCI6InBydWViYXMxODRAZ21haWwuY29tIiwiaWF0IjoxNzI4MTYwMDIwfQ.jAaqtttJuXXjEVy5-Q_WIbfGrySYrWc9HbjT4qdEQE0'


  Scenario: validar peticion GET
    Given path pathArticulos
    And param limit = 10
    And param offset = 0
    When method GET
    Then status 200

  Scenario: validar dinamicamente una lista de articulos
    * def claseJava =
    """
    function(articulos){
      var javaGenerate = Java.type('conduit.NumeroAleatorio');
      var item = new javaGenerate();
      return item.getNumeroAleatorio(articulos);

    }
    """
    Given path pathArticulos
    And param limit = 10
    And param offset = 0
    When method GET
    Then status 200
    * print response
    * def numAleatorio = claseJava(response.articles)
    * print numAleatorio
    * json result = response.articles[numAleatorio]
    * print result
    And match result contains {"title":"#string"}
