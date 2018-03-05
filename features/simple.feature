Feature: Simple scenario

  Scenario: test response code
    Given A simple service to test, response code 200

  Scenario: test response body
    Given A simple service to test, respose body should be body to assert

  Scenario: test specific response body
    Given A simple service to test
    Then I give a path /path/path
    Given respose body should be body to assert + path
