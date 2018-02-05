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

  if BROWSER.eql? 'chrome'
    config.default_driver = :selenium_chrome
  elsif BROWSER.eql? 'firefox'
    config.default_driver = :selenium
  else
    config.default_driver = :selenium_chrome
  end
end
