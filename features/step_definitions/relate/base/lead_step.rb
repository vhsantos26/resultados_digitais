require_relative '../../../pages/relate/base/leads_page'

lead_page = LeadsPage.new

Given(/I have access to Base of Leads App./) do
  lead_page.load
end

Given(/Teste right/) do
  pending 'Need to do this'
end
