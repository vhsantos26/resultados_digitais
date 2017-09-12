login_page = LoginPage.new
leads_page = LeadsPage.new
new_leads_page = NewLeadPage.new
lead_detail_page = LeadDetailPage.new

new_lead_name = Faker::Name.unique.name

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
    new_leads_page.fill_in_all_leads_information new_lead_name
end

And(/^I click on save button.$/) do
    new_leads_page.save_button.click
end

Then(/^I should see my new lead information.$/) do
    expect(lead_detail_page.lead_name).to have_content new_lead_name
end

And (/^Life Cycle are '(.*?)'.$/) do |life_cycle|
    expect(lead_detail_page.lead_life_cycle).to have_content "Estágio do funil: #{life_cycle}"
end

When(/^I click to edit first lead at my list.$/) do
    leads_page.edit_lead.first.click
    @remove_lead_name = lead_detail_page.lead_name.text
end

And(/^I click on remove this lead.$/) do
    lead_detail_page.click_on_remove_lead
    lead_detail_page.accept_alert
end

Then(/^I don't should see my lead after search it.$/) do
    leads_page.search_lead @remove_lead_name
    expect(leads_page).to have_content "Não foram encontrados Leads para a sua busca."
end
