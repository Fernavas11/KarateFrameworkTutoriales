Feature: token basic and bearer

  Scenario: bearer token
    Given url 'https://api.github.com/user/repos'
    When header Authorizacion = 'bearer ghp_0qWuv0fxH1jf0nIPeyCJNWPdc6v7VK0CbyWy'
    * method GET
    Then status 200

  @token
  Scenario: Basic authentication test
    * def config = read('tokenB.json')
    Given url 'https://postman-echo.com/basic-auth'
    * def credentials = config.username + ':' + config.password
    * def Base64 = Java.type('java.util.Base64')
    * def encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes())
    * def token = 'Basic ' + encodedCredentials
    When header Authorization = token
    And method GET
    Then status 200