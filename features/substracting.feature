Feature: Substracting

  Scenario: Substract two numbers
    Given the new input "2-2"
    When the calculator is run again
    Then the output should be: "0"