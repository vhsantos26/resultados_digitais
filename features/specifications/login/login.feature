@login
Feature: Login
  In order to access the application.
  As a RD client.
  I want to login with my user.

  @successful
  Scenario: Login successfully.
		When I login with "vhsantos26@gmail.com" email and "111111" password.
    Then I am authenticated successfully.
    And I should see Dashboard page.
