require 'allure-cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'dotenv'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'

Dotenv.load # realiza o load das variaveis do arquivo .env

class Cucumber::Core::Test::Step
  def name
    text
  end
end
