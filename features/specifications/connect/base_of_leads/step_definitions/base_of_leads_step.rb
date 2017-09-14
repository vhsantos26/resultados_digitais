login_page = LoginPage.new
leads_page = LeadsPage.new
new_leads_page = NewLeadPage.new
lead_detail_page = LeadDetailPage.new
import_leads_page = ImportLeadsPage.new

Given(/^I have logged in.$/) do
    login_page.load
    login_page.log_in "vhsantos26@gmail.com", "111111"
end

Given(/^I have access to Base of Leads App.$/) do
    leads_page.load
end

And(/^I am on Insert New Leads page.$/) do
    leads_page.click_on_insert_lead
end

When(/^I fill in all lead information.$/) do
    @new_lead_name = Faker::Name.unique.name
    new_leads_page.fill_in_all_leads_information @new_lead_name
end

And(/^I save this register.$/) do
    new_leads_page.save_button.click
end

Then(/^I should see the new lead information.$/) do
    expect(lead_detail_page.lead_name).to have_content @new_lead_name
end

And (/^Funnel Stage are '(.*?)'.$/) do |life_cycle|
    expect(lead_detail_page.lead_life_cycle).to have_content "Estágio do funil: #{life_cycle}"
end

Then(/^I should see a alert about required field.$/) do
    expect(new_leads_page).to have_content "Não foi possível criar o Lead, por favor verifique os campos"
end

When(/^I edit first lead at the list.$/) do
    leads_page.edit_lead.first.click
    @remove_lead_name = lead_detail_page.lead_name.text
end

And(/^I remove this lead.$/) do
    lead_detail_page.click_on_remove_lead
    lead_detail_page.accept_alert
end

Then(/^I don't should see the lead after search it.$/) do
    leads_page.search_lead @remove_lead_name
    expect(leads_page).to have_content "Não foram encontrados Leads para a sua busca."
end

When(/^I click on Import Leads.$/) do
    leads_page.import_leads.click
end

And(/^I import a file with one lead.$/) do
    @conversion_name = Faker::Name.unique.first_name
    import_leads_page.load_list_import_file.set File.absolute_path("features/resources/leads.csv")
    import_leads_page.accept_all_terms
    import_leads_page.load_list_import_reason.select "Inclusão - Leads em outro sistema que não tem integração"
    import_leads_page.load_list_confirm_button.click
    import_leads_page.combine_fields_save_and_proceed_button.click
    import_leads_page.generate_conversion :conversion => true
    import_leads_page.conversion_name.set @conversion_name
    import_leads_page.conversion_import_button.click
end

Then(/^I should see that     import was successful.$/) do
    expect(import_leads_page.import_list_status.first).to have_content "importada"
end

And(/^after search, I should see one Lead as a result.$/) do
    leads_page.load
    leads_page.search_lead @conversion_name
    expect(leads_page).to have_content @conversion_name
end
