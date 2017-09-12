login_page = LoginPage.new
leads_page = LeadsPage.new
new_leads_page = NewLead.new

new_lead_email = nil

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
    new_lead_email = new_leads_page.fill_in_all_leads_information
end

And(/^I click on save button.$/) do
    new_leads_page.save_button.click
end

Then(/^I should see my new lead information.$/) do
    expect(new_leads_page).to have_content new_lead_email
end

And (/^The Funnel Stage are '(.*?)'.$/) do |funel_stage|
    expect(new_leads_page).to have_content "Estágio do funil: #{funel_stage}"
end
