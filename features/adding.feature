Feature: Adding
  @calc @operation @single
  Scenario: Add two numbers
    Given the input "2+2"
    When the calculator is run
    Then the output should be "4"