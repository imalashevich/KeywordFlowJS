Feature: Tests for Task 2

    Scenario: 1: Check user is able to select User from dropdown
        Given User navigates to "http://localhost:3000"
        When User clicks Create exercise log button "[data-ta='nav-link-create-exercise']"
        And User selects item "option" with text "Iryna Malashevich" from user dropdown "[data-ta='selectUser']"
        Then User dropdown "[data-ta='selectUser']" contains "Iryna Malashevich" text

    Scenario: 2: Date picker exists and able to select data
        Given User navigates to "http://localhost:3000"
        When User clicks Create exercise log button "[data-ta='nav-link-create-exercise']"
        Then Data picker "[data-ta='date']" is displayed
        When User clicks date field "[data-ta='date'] input"
        And User selects current date "[class*='react-datepicker__day react-datepicker__day--017']"
        Then Empty date "[class='react-datepicker-ignore-onclickoutside']" is not displayed

    Scenario: 3: Submit is disabled when required fields are not filled
        Given User navigates to "http://localhost:3000"
        When User clicks Create exercise log button "[data-ta='nav-link-create-exercise']"
        And User clicks Submit button "[data-ta='submitExercise']"
        #don't see any disabled attribute for Submit button
        Then Next page "[id='root'] h3" with text "Logged Exercises" is not displayed

    Scenario: 4: Check description And Duration fields exist
        Given User navigates to "http://localhost:3000"
        When User clicks Create exercise log button "[data-ta='nav-link-create-exercise']"
        Then Description field "[data-ta='description']" is displayed
        And Duration field "[data-ta='duration']" is displayed

    Scenario: 5: E2E - Create new exercise for client
        Given User navigates to "http://localhost:3000"
        When User clicks Create exercise log button "[data-ta='nav-link-create-exercise']"
        And User selects item "option" with text "Iryna Malashevich" from user dropdown "[data-ta='selectUser']"
        And User enters "Description" in Description field "[data-ta='description']"
        And User clicks date field "[data-ta='date'] input"
        And User enters "04/21/2023" in date field "[data-ta='date'] input"
        And User clears text from Duration field "[data-ta='duration']"
        And User enters "10" in Duration field "[data-ta='duration']"
        And User clicks Submit button "[data-ta='submitExercise']"
        Then Logged Exercises page "[id='root'] h3" with text "Logged Exercises" is displayed
        And Exercises table "[data-ta='exercise-list']" data contains values:
            | Username          | Description | Duration | Date       | Actions        |
            | Iryna Malashevich | Description | 10       | 2023-04-21 | edit \\ delete |