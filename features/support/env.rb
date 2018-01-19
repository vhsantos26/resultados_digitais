require 'allure-cucumber'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'

Capybara.configure do |c|
  c.app_host = 'https://app-staging.rdstation.com.br/'
  c.default_driver = :selenium_chrome_headless
  c.ignore_hidden_elements = false
end

Capybara.default_max_wait_time = 10

AllureCucumber.configure do |c|
  c.include AllureCucumber::DSL
  c.output_dir = 'log/reports'
  c.clean_dir = true
end
