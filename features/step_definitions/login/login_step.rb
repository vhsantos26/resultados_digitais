require_relative '../../pages/app'

app = App::Application.new

When('I perform authentication with {string} email and {string} password.') do |email, password|
  app.login_index.load
  app.login_index.log_in(email, password)
end

Then('I am authenticated successfully.') do
  expect(app.dashboard_index.navbar).to have_logo
end

Then('I should see Dashboard page.') do
  expect(app.dashboard_index.title).to have_content 'Challenge Project'
end

Given('I have logged in.') do
  step 'I perform authentication with "vhsantos26@gmail.com" email and "111111" password.'
  step 'I am authenticated successfully.'
end
