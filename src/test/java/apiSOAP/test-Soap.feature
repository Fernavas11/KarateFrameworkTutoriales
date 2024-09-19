@soapRequest

Feature: Plan de pruebas orientado a las consultas de tipo SOAP

  Scenario Outline: caso de pruebas <numero>
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    When header Content-Type = 'text/xml'
    * request
      """
      <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
      <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
      <ubiNum><num></ubiNum>
      </NumberToWords>
      </soap:Body>
      </soap:Envelope>
      """
    * method POST
    * match response/Envelope/Body/NumberToWordsResponse/NumberToWordsResult == '<asercion> '
    Then status <statusA>
    Examples:
      | numero         | num   | statusA | asercion      |
      | numero 800     | 800   | 200     | eight hundred |
      | numero 11      | 11    | 200     | #string       |
      | formato string | "800" | 200     | #string       |
      | numero null    | null  | 200     | #string       |
      | numero vacio   |       | 200     | zero          |

  @test2
  Scenario Outline: caso de prueba read xml
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    When header Content-Type = 'text/xml'
    * request read ('body.xml')
    * method POST
    Examples:
      | num |
      | 2   |
      | 800 |
      | 11  |
      | 200 |