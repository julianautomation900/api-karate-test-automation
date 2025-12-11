Feature:  Get all posts

  Background:
    * url "https://jsonplaceholder.typicode.com/"
    * path "posts"

  @github_actions
  Scenario: Get all posts
    Given method get
    Then status 200


