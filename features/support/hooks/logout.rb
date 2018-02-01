require 'capybara'

After('@login') do
  app = App::Application.new
  app.logout_index.load
end
