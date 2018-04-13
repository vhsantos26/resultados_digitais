@wip @lead
Feature: New lead
  In order to increase my base of leads.
  As a RD client.
  I want to include a lead manually.

  Background: Login and access base of Leads page.
    Given I have logged in.
    And I have access to Base of Leads App.

  @regression @new_lead
  Scenario: Insert successfully lead when it's was created manually.
    And I insert a new lead manually with:
      | event_name         | name               | email             |
      | Manually inclusion | Lanre Themistocles | Lanre@fleckens.hu |
    When I save this registed.
    Then I should see the new lead informations.

  @exception @new_lead
  Scenario: Show error message when try to insert manually without email.
    And I insert a new lead manually with:
      | event_name | name       | email |
      | Exception  | I am Groot |       |
    When I save this register.
    Then I should see a alert about required field.

    # Não foi possível criar o Lead, por favor verifique os campos