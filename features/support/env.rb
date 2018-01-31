require 'capybara'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'

Capybara.configure do |c|
  c.app_host = 'https://app-staging.rdstation.com.br/'
  c.ignore_hidden_elements = false
  c.default_max_wait_time = 5
end

Capybara.register_driver Capybara.default_driver do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      'chromeOptions' => {
        'args' => ['--disable-infobars', '--window-size=1366,768']
      }
    )
  )
end
