@csv&json
  Feature: test csv y test json

Scenario Outline: Caso de prueba <NombreCaso>
Given url 'https://reqres.in/api/users'
When request {"<name>": "<Vname>","<job>": "<Vjob>"}
And method POST
  #* match $.name == '#string'
Then status 201
Examples:
|read('test.csv')|


  @prueba2
  Scenario Outline: caso de prueba read json <NombreCaso>
    Given url 'https://reqres.in/api/users'
    * request read ('body.json')
    * method POST
    #* match $.name == '#string'
    Then status 201
    Examples:
      | NombreCaso     | name | Vname | job | Vjob |
      | name vacio     | name |       | job | QA   |
      | name nulo      | name | null  | job | QA   |
      | name 3 letras  | name | sol   | job | QA   |
      | sin campo name |      |       | job | QA   |