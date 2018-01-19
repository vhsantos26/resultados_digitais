require_relative '../../pages/login/login_page'
require_relative '../../pages/dashboard/dashboard_page'

login = LoginPage.new
dashboard = DashboardPage.new

Given(/I'm at login page./) do
  login.load
end

When(/I login with correct user./) do
  login.log_in('vhsantos26@gmail.com', '111111')
end

Then(/I should see Dashboard page./) do
  expect(dashboard.title).to have_content 'Challenge Project'
end
