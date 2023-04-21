@smoke
Feature: Test framework work visual - failed
  Demonstarte test framework

@visual
  Scenario Outline: Scenario Outline name: Verify search <scientist> redirect to the page with his portrait
    Given User navigates to "https://www.wikipedia.org/"
    When User enters "<scientist>" in [Search field] "#searchInput"
      And User clicks [Search button] "button[type=submit]"
    Then [Page title] "#firstHeading" text is equal to "<scientist>"
      And Page URL contains "/<path>"
    Then User visually check "wikiResultPage|infoBoxPortrait" element as "<portrait>"
    Examples:
      | scientist    | path         | portrait        |
      | Isaac Newton | Isaac_Newton | isaak_portrait  |
      | Nikola Tesla | Nikola_Tesla | nikola_portrait |

  @visual
  Scenario: Verify Create User Form default statement
    Given User navigates to "http://localhost:3000/user"
    Then User visually check "form[data-ta='create-user']" element as "create-user-default"
  
  @visual
  Scenario: Verify Create exercise Form default statement
    Given User navigates to "http://localhost:3000/create"
    Then User visually check "form[data-ta='create-exercise']" element as "create-exercise-default"
