Feature: Create new pets

  Background:
    * url baseUrl
    * path 'pets'

  Scenario: Create a new dog
    Given request { "name": "Bingo3", "type": "Perro","age": 1}
    When method post
    Then status 201
    And match $.message contains "Pet created"

  Scenario: Search a new dog
    Given request { "name": "Bingo3", "type": "Perro","age": 1}
    And method post
    And status 201
    And def petId = $.data.id
    When url "http://localhost:3000/pets/" + petId
    And method get
    Then status 200

  Scenario: Update a pet
    Given request { "name": "Bingo3", "type": "Perro","age": 1}
    And method post
    And status 201
    And def petId = $.data.id
    When url "http://localhost:3000/pets/" + petId
    And request { "name": "Bingo8", "type": "Gato","age": 10}
    And method put
    Then status 200
    And match $.data.name == "Bingo8"
    And match $.data.type == "Gato"

  Scenario: Update partially a pet
    Given request { "name": "Bingo3", "type": "Perro","age": 1}
    And method post
    And status 201
    And def petId = $.data.id
    When url "http://localhost:3000/pets/" + petId
    And request { "name": "Bluey" }
    And method patch
    Then status 200
    And match $.data.name == "Bluey"

  Scenario: Delete a pet
    Given request { "name": "Bingo3", "type": "Perro","age": 1}
    And method post
    And status 201
    And def petId = $.data.id
    And url "http://localhost:3000/pets/" + petId
    When method delete
    Then status 204

  Scenario Outline: Create a new pet
    Given request { "name": "#(name)", "type": "#(type)","age": #(parseInt(age))}
    When method post
    Then status 201
    And match $.message contains "Pet created"
    Examples:
      | name    | type  | age |
      | Bluey 1 | Perro | 1   |
      | Bluey 2 | Gato  | 2   |
      | Bluey 3 | Loro  | 3   |
      | Bluey 4 | Oveja | 4   |
      | Bluey 5 | Perro | 5   |

  Scenario Outline: Create a new pet with <description>
    Given request { "name": "<name>", "type": "<type>","age": <age>}
    When method post
    Then status <expectedStatus>
    And match $.message contains "<expectedMessage>"
    Examples:
      | name                 | type  | age | description        | expectedStatus | expectedMessage |
      | Bluey 1 hhhhdhdhhdhd | Perro | 1   | long name          | 201            | Pet created     |
      | Bluey 2 !!!          | Gato  | 2   | invalid characters | 201            | Pet created     |


  Scenario: Create a new dog reading an external file
    * def createANewPetRequest = read('classpath:requests/createANewPet.json')
    * def successfulPetCreationResponse = read('classpath:responses/successfulPetCreationResponse.json')

    Given request createANewPetRequest
    When method post
    Then status 201
    And match $.message contains "Pet created"
    And match response == successfulPetCreationResponse

  Scenario: Create a new dog reading an external file as template

    * def name = 'Testing'
    * def type = 'Perro'
    * def age = 1

    * def createANewPetRequest = read('classpath:requests/createANewPetTemplate.json')
    * def successfulPetCreationResponse = read('classpath:responses/successfulPetCreationResponse.json')

    * print createANewPetRequest

    Given request createANewPetRequest
    When method post
    Then status 201
    And match $.message contains "Pet created"
    And match response == successfulPetCreationResponse