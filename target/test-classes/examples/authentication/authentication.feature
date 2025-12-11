Feature: Create new pets

Scenario: Basic authentication

* def credentials = "admin:password123"
* def encoded = Java.type('java.util.Base64').encoder.encodeToString(credentials.getBytes())


Given url "http://localhost:3000"
And path "protected-basic"
And header Authorization = 'Basic ' + encoded
When method get
Then status 200

Scenario: Basic authentication

* def credentials = "admin:password1234"
* def encoded = Java.type('java.util.Base64').encoder.encodeToString(credentials.getBytes())

Given url "http://localhost:3000"
And path "protected-basic"
And header Authorization = 'Basic ' + encoded
When method get
Then status 401

Scenario: Bearer authentication
Given url "http://localhost:3000"
And path "login"
And request {"username": "automation"}
And method post
And status 200
And def accessToken = $.data.accessToken
And path "protected-bearer"
And header Authorization = "Bearer " + accessToken
When method get
Then status 200

