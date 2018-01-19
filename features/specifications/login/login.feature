@login
Feature: Login
  In order to access the application.
  As a RD client.
  I want to login with my user.

  Scenario: Login successfully.
		Given I'm at login page.
		When I login with correct user.
    Then I should see Dashboard page.