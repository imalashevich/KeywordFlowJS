@example
Feature: Wiki page

Scenario: Verify search functionality works correctly
Given User navigates to "https://www.wikipedia.org/"
When User enters "Isaac Newton" in [Search field] "#searchInput"
And User clicks [Search button] "button[type=submit]"
Then [Page title] "#firstHeading" text is equal to "Isaac Newton"
#And Page URL contains "Isaac_Newton"
