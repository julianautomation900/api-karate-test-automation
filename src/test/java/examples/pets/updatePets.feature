Feature: Update pets

  Background:
    * url baseUrl
    * path 'pets'

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