login_page = LoginPage.new
base_of_leads_page = BaseOfLeads.new
new_lead_page = NewLead.new

Given(/^I have logged in.$/) do
    login_page.load
    login_page.log_in "vhsantos26@gmail.com", "111111"
end

Given(/^I have access to Base of Leads App.$/) do
    base_of_leads_page.load
end

And(/^I am on Insert New Leads page.$/) do
    base_of_leads_page.click_on_insert_lead
end

When(/^I fill in all lead information.$/) do
    new_lead_email = new_lead_page.fill_in_all_leads_information
end

And(/^I click on save button.$/) do
    new_lead_page.save_button.click
end

Then(/^I should see a lead information.$/) do
    expect(new_lead_page).to have_content new_lead_email
end

And (/^Funnel Stage are '.*?'.$/) do 
    expect(new_lead_page).to have_content "Estágio do funil: Lead"
end