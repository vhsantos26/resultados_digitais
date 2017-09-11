@include_new_leads @wip
Feature: Include new leads
  In order to incrase my base of leads.
  As a RD client.
  I want to include new leads manually.

  Background: Login and access base of leads page.
    Given I have logged in.
    And I have access to Base of Leads App.

  @basic_lead_info
  Scenario: Include a new lead with only email filled.
    Given I am on Insert New Leads page.
    When I fill email field.
    And I click on save button.
    Then I should see a lead information.
