Feature: List Leagues
  As a API client
  I want to get all cricket leagues in the world
  So that I can get related information about them
  
  Background:
    Given I send and accept JSON 
  
  Scenario: List Leagues
    Given the system knows about the following leagues:
      | league | 
      | PSL    |
      | IPL    | 
    When client requests GET "/leagues"
    Then the response status should be "200"
    And it has following attributes
      | name | country  |
      | PSL  | Pakistan |
      | IPL  | India    | 