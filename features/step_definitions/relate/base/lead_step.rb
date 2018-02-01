require_relative '../../../pages/relate/base/leads'

lead = Leads.new

Given('I have access to Base of Leads App.') do
  lead.load
end

Given('I insert a new lead manually with:') do |table|
  lead_info = table.hashes
end

When('I save this registed.') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the new lead informations.') do
  pending # Write code here that turns the phrase above into concrete actions
end
