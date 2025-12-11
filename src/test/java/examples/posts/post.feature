Feature:  Get all posts

  Background:
    * url "https://jsonplaceholder.typicode.com/"
    * path "posts"

  Scenario: Get all posts
    Given method get
    Then status 200

