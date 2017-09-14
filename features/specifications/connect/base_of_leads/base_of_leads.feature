@base_of_leads
Feature: Include new leads
    In order to increase my base of leads.
    As a RD client.
    I want to include, import, edit, remove all of my Leads.

    Background: Login and access base of Leads page.
        Given I have logged in.
        And I have access to Base of Leads App.

    @core @all_lead_info
    Scenario: Include a new lead with all information filled.
        Given I am on Insert New Leads page.
        When I fill in all Lead information.
        And I save this register.
        Then I should see the new Lead information.
        And Funnel Stage are 'Lead'.

    @core @import_lead
    Scenario: Import a new lead from CSV file for inclusion.
        When I click on Import Leads.
        And I import a file with one Lead.
        Then I should see that import was successful.
        And after search, I should see one Lead as a result.

    @exception @without_email
    Scenario: Include a new lead without email.
        Given I am on Insert New Leads page.
        When I save this register.
        Then I should see a alert about required field.

    @exception @edit_lead @wip
    Scenario: Edit lead and change the funnel stage.
        When I select first Lead at the list.
        And I edit this Lead.
        And I select 'Lead Qualificado' for funnel stage.
        And I save this change.
        Then I should see the log about funnel activity.
        And I should see the Lead after search it with segmentation filter.

    @remove_lead
    Scenario: Remove a exist Lead from the Base of Leads.
        When I select first Lead at the list.
        And I remove this Lead.
        Then I don't should see the Lead after search it.
