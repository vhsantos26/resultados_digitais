require 'capybara'

After('@login') do
  logout = LogoutPage.new
  logout.load
end
