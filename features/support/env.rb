require 'capybara'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'

BROWSER = ENV['BROWSER']

Capybara.configure do |config|
  config.app_host = 'https://app-staging.rdstation.com.br/'
  config.ignore_hidden_elements = false
  config.default_max_wait_time = 5

  config.default_driver = if BROWSER.eql? 'chrome'
                            :selenium_chrome
                          elsif BROWSER.eql? 'firefox'
                            :selenium
                          else
                            :selenium_chrome
                          end
end
