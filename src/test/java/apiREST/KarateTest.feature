Feature: plan de pruebas

  Scenario Outline: caso de prueba <NombreCaso>

    Given url 'https://reqres.in/api/users/<ID>'
    * header Content-Type = 'Aplication/json'
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    When method GET
    #And match $.data.id == '#number'
    Then status <estadoHTTP>
    Examples:
      | NombreCaso     | ID | estadoHTTP |
      | Caso 1         | 1  | 200        |
      | Caso 2         | 2  | 200        |
      | Caso 3         | 3  | 200        |
      | Caso not found | 50 | 404        |

  @prueba
  Scenario Outline: <NombreCaso>
    Given url 'https://reqres.in/api/users'
    When request {"<name>": "<Vname>","<job>": "<Vjob>"}
    And method POST
    #* match $.name == '#string'
    Then status 201
    Examples:
      | NombreCaso     | name | Vname | job | Vjob |
      | name vacio     | name |       | job | QA   |
      | name nulo      | name | null  | job | QA   |
      | name 3 letras  | name | sol   | job | QA   |
      | sin campo name |      |       | job | QA   |

  Scenario: caso de prueba tipo POST numero 2
    Given url 'https://reqres.in/api/users'
    When request
      """
      {
        "name": "Prueba",
        "job": "leader"
      }
      """
    And method POST
    Then status 201

  Scenario: caso de prueba tipo DELETE
    Given url 'https://reqres.in/api/users/3'
    When method DELETE
    Then status 204
