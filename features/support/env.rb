require "capybara/cucumber"
require "selenium-webdriver"
require "site_prism"
require "require_all"
require "rspec/expectations"
require "faker"

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 10
Capybara.app_host = 'https://app-staging.rdstation.com.br/'

Capybara.ignore_hidden_elements = false

Before do |scenario|
    job_name = "#{scenario.feature.name} - #{scenario.name}"
    Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
        :browser => :chrome,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
            'chromeOptions' => {
                'args' => ['--start-maximized', '--disable-infobars']
            }
        ))
    end
    Capybara.session_name = "#{job_name}"
    @driver = Capybara.current_session.driver
end

After do |scenario|
    @driver.quit
end
