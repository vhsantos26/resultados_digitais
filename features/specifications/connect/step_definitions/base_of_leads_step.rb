login_page = LoginPage.new
base_of_leads_page = BaseOfLeads.new
new_lead_page = NewLead.new

new_lead_email = Faker::Internet::unique.email

Given(/^I have logged in.$/) do
    login_page.load
    login_page.log_in "vhsantos26@gmail.com", "111111"
end

Given(/^I have access to Base of Leads App.$/) do
    base_of_leads_page.load
end

And(/^I am on Insert New Leads page.$/) do
    base_of_leads_page.new_lead.click
end

When(/^I fill email field.$/) do
    new_lead_page.lead_email.set new_lead_email
end

And(/^I click on save button.$/) do
    new_lead_page.save_button.click
end

Then(/^I should see a lead information.$/) do
    expect(new_lead_page).to have_content new_lead_email
end
