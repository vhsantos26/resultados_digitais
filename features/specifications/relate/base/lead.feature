@wip @lead
Feature: Include new leads
  In order to increase my base of leads.
  As a RD client.
  I want to include, import, edit, remove all of my Leads.

  Background: Login and access base of Leads page.
    Given I have logged in.
    And I have access to Base of Leads App.

  @new_lead
  Scenario: Insert successfully lead when it's was created manually.
    And I insert a new lead manually with:
      | event_name         | name               | email             |
      | Manually inclusion | Lanre Themistocles | Lanre@fleckens.hu |
    When I save this registed.
    Then I should see the new lead informations.
