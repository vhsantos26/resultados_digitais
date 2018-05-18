require_relative '../../../pages/app'

app = App::Application.new

Given('I have access to Base of Leads App.') do
  app.leads_base_index.load
end

Given('I insert a new lead manually with:') do |table|
  @lead_info = table.hashes
  @lead_info.each do |lead|
    app.leads_base_index.new_lead.load
    app.leads_base_index.new_lead.conversionSection.event_name.set lead[:event_name]
    app.leads_base_index.new_lead.identificationSection.name.set lead[:name]
    app.leads_base_index.new_lead.identificationSection.email.set lead[:email]
    app.leads_base_index.new_lead.footerSection.save.click
  end
end

When('I save this registed.') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the new lead informations.') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I save this register.') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a alert about required field.') do
  pending # Write code here that turns the phrase above into concrete actions
end
