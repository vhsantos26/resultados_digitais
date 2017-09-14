When(/^I click on Import Leads.$/) do
    BaseOfLeadsModule.leads_page.import_leads.click
end

And(/^I import a file with one Lead.$/) do
    @conversion_name = Faker::Name.unique.first_name
    BaseOfLeadsModule.import_leads_page.import_file.set File.absolute_path("features/resources/leads.csv")
end

And(/^I accept all terms.$/) do
    BaseOfLeadsModule.import_leads_page.confirm_step_section.accept_all_terms
    BaseOfLeadsModule.import_leads_page.confirm_step_section.import_reason.select "Inclusão - Leads em outro sistema que não tem integração"
    BaseOfLeadsModule.import_leads_page.confirm_step_section.confirm_button.click
end

And(/^I choose for conversion for all of Leads.$/) do
    BaseOfLeadsModule.import_leads_page.save_and_proceed_button.click
    BaseOfLeadsModule.import_leads_page.conversion_step_section.generate_conversion :conversion => true
    BaseOfLeadsModule.import_leads_page.conversion_step_section.conversion_name.set @conversion_name

    BaseOfLeadsModule.import_leads_page.import_button.click
end

Then(/^I should see that import was successful.$/) do
    BaseOfLeadsModule.import_leads_page.wait_until_import_list_status_visible(20)
    expect(BaseOfLeadsModule.import_leads_page.import_list_status.first).to have_content "importada"
end

And(/^after search, I should see one Lead as a result.$/) do
    BaseOfLeadsModule.leads_page.load
    BaseOfLeadsModule.leads_page.search_lead @conversion_name
    expect(BaseOfLeadsModule.leads_page).to have_content @conversion_name
end
