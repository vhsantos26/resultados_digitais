@include_new_leads
Feature: Include new leads
  In order to incrase my base of leads.
  As a RD client.
  I want to include new leads manually.

  Background: Login and access base of leads page.
      Given I have logged in.
      And I have access to Base of Leads App.

  @all_lead_info
  Scenario: Include a new lead with all information filled.
      Given I am on Insert New Leads page.
      When I fill in all lead information.
      And I click on save button.
      Then I should see my new lead information.
      And The Funnel Stage are 'Lead'.
