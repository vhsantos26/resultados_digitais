
Given(/^I have logged in.$/) do
    BaseOfLeadsModule.login_page.load
    BaseOfLeadsModule.login_page.log_in "vhsantos26@gmail.com", "111111"
end

And(/^I have access to Base of Leads App.$/) do
    BaseOfLeadsModule.leads_page.load
end

Given(/^I am on Insert New Leads page.$/) do
    BaseOfLeadsModule.leads_page.click_on_insert_lead
end

When(/^I fill in all Lead information.$/) do
    @new_lead_name = Faker::Name.unique.name
    BaseOfLeadsModule.new_leads_page.fill_in_all_leads_information @new_lead_name
end

And(/^I save this register.$/) do
    BaseOfLeadsModule.new_leads_page.save_button.click
end

Then(/^I should see the new Lead information.$/) do
    expect(BaseOfLeadsModule.lead_detail_page.lead_name).to have_content @new_lead_name
end

And (/^Funnel Stage are '(.*?)'.$/) do |funnel_stage|
    expect(BaseOfLeadsModule.lead_detail_page.lead_funnel_stage).to have_content "Estágio do funil: #{funnel_stage}"
end

When(/^I click on Import Leads.$/) do
    BaseOfLeadsModule.leads_page.import_leads.click
end

And(/^I import a file with one Lead.$/) do
    @conversion_name = Faker::Name.unique.first_name
    BaseOfLeadsModule.import_leads_page.load_list_import_file.set File.absolute_path("features/resources/leads.csv")
    BaseOfLeadsModule.import_leads_page.accept_all_terms
    BaseOfLeadsModule.import_leads_page.load_list_import_reason.select "Inclusão - Leads em outro sistema que não tem integração"
    BaseOfLeadsModule.import_leads_page.load_list_confirm_button.click
    BaseOfLeadsModule.import_leads_page.combine_fields_save_and_proceed_button.click
    BaseOfLeadsModule.import_leads_page.generate_conversion :conversion => true
    BaseOfLeadsModule.import_leads_page.conversion_name.set @conversion_name
    BaseOfLeadsModule.import_leads_page.conversion_import_button.click
end

Then(/^I should see that import was successful.$/) do
    BaseOfLeadsModule.import_leads_page.wait_until_import_list_status_visible(15)
    #wait_until_BaseOfLeadsModule.import_leads_page.import_list_status.first_visible
    expect(BaseOfLeadsModule.import_leads_page.import_list_status.first).to have_content "importada"
end

And(/^after search, I should see one Lead as a result.$/) do
    BaseOfLeadsModule.leads_page.load
    BaseOfLeadsModule.leads_page.search_lead @conversion_name
    expect(BaseOfLeadsModule.leads_page).to have_content @conversion_name
end

Then(/^I should see a alert about required field.$/) do
    expect(BaseOfLeadsModule.new_leads_page).to have_content "Não foi possível criar o Lead, por favor verifique os campos"
end

When(/^I select first Lead at the list.$/) do
    BaseOfLeadsModule.leads_page.lead_detail.first.click
    @lead_name = BaseOfLeadsModule.lead_detail_page.lead_name.text
end

And(/^I edit this Lead.$/) do
    BaseOfLeadsModule.lead_detail_page.edit_lead.click
end

And(/^I select '(.*?)' for funnel stage.$/) do |funnel_stage|
    @funnel_stage = funnel_stage
    BaseOfLeadsModule.edit_lead_page.lead_funnel_stage.select funnel_stage
end

And(/^I save this change.$/) do
    BaseOfLeadsModule.edit_lead_page.save_button.click
end

Then(/^I should see the log about funnel activity.$/) do
    expect(BaseOfLeadsModule.lead_detail_page).to have_content "Teve seu estágio no funil alterado para '#{@funnel_stage}'."
end

And(/^I should see the Lead after search it with segmentation filter.$/) do
    BaseOfLeadsModule.leads_page.load
    BaseOfLeadsModule.leads_page.segmentation_filter.select "Leads Qualificados (estágio no funil)"
    expect(BaseOfLeadsModule.leads_page).to have_content @lead_name
end

And(/^I remove this Lead.$/) do
    BaseOfLeadsModule.lead_detail_page.click_on_remove_lead
    BaseOfLeadsModule.lead_detail_page.accept_alert
end

Then(/^I don't should see the Lead after search it.$/) do
    BaseOfLeadsModule.leads_page.search_lead @lead_name
    expect(BaseOfLeadsModule.leads_page).to have_content "Não foram encontrados Leads para a sua busca."
end
