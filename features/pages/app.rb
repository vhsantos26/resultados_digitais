require_relative 'authentication/authentication'
require_relative 'dashboard/dashboard'
require_relative 'relate/base_of_lead/new_lead'

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

    def new_lead_index
      NewLead.new
    end

    class NewLead
      def conversion_index
        App::Pages::NewLead::Conversion::IndexPage.new
      end

      def identification_index
        App::Pages::NewLead::Identification::IndexPage.new
      end

      def footer_section
        App::Pages::NewLead::Sections::Footer.new
      end
    end
  end
end
