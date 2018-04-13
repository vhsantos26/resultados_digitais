require_relative 'authentication/authentication'
require_relative 'dashboard/dashboard'
require_relative 'relate/base_of_lead/base_of_lead'

module App
  class Application
    def login_index
      Authentication::LoginPage.new
    end

    def logout_index
      Authentication::LogoutPage.new
    end

    def dashboard_index
      Dashboard::HomePage.new
    end

    def new_lead_index
      LeadsBase.new_lead
    end
  end
end
