@login
Feature: RD Station Authentication
  In order to access the application.
  As a RD client.
  I want to authenticate my user.

  @successful
  Scenario: Authentication successfully.
    When I perform authentication with "vhsantos26@gmail.com" email and "111111" password.
    Then I am authenticated successfully.
    And I should see Dashboard page.
