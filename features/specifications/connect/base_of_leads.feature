@include_new_leads
Feature: Include new leads
    In order to incrase my base of leads.
    As a RD client.
    I want to include new leads manually.

    Background: Login and access base of leads page.
        Given I have logged in.
        And I have access to Base of Leads App.

    @all_lead_info @include_lead
    Scenario: Include a new lead with all information filled.
        Given I am on Insert New Leads page.
        When I fill in all lead information.
        And I save this register.
        Then I should see my new lead information.
        And Life Cycle are 'Lead'.

    @import_leads @wip
    Scenario: Import a new lead from CSV file for inclusion.
        When I click on Import Leads.
        And I import a file with one lead.
        Then I should see that my import was successful.
        And after search, I should see my lead.

    @remove_lead
    Scenario: Remove a exist lead from the Base of Leads.
        When I edit first lead at my list.
        And I remove this lead.
        Then I don't should see my lead after search it.
