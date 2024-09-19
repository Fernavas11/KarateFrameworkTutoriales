@graphQLTEST

Feature: plan de pruebas asociado a query graphQL

  Scenario Outline: caso de prueba query <NombreCaso>

    Given url 'https://rickandmortyapi.com/graphql'
    When text query =
      """
      query {
  character(id:<numero>)
  {name,
  status,
  species,
  gender}
}
      """
    * request {query : '#(query)'}
    * method POST
    Then status 200
    Examples:
      | Nombrecaso  | numero |
      | Caso normal | 2      |
      | Id 13       | 13     |


@casotxt
  Scenario Outline: caso de prueba body call <NombreCaso>

    Given url 'https://rickandmortyapi.com/graphql'
    When def query = read ('testGRAPH.txt')
    * replace query.num = <num>
    * request {query : '#(query)'}
    * method POST
    Then status 200
    Examples:
      | Nombrecaso  | num |
      | Caso normal | 2      |
      | Id 13       | 13     |
