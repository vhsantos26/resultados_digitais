require_relative 'authentication/authentication'
require_relative 'dashboard/dashboard'

module App
  class Application
    def login_index
      App::Pages::Authentication::Login::IndexPage.new
    end

    def logout_index
      App::Pages::Authentication::Logout::IndexPage.new
    end

    def dashboard_index
      App::Pages::Dashboard::IndexPage.new
    end
  end
end
