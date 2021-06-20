Feature: Validate Search Functionality
  Scenario: Search Item on Application
    Given User is on Main page
    When User enter search item "iPhone 11 Case"
    And User click on Search
    Then User navigate to search result page
    And User select the Model name "iPhone 11"
    Then User add to bag
    And User go to bag
