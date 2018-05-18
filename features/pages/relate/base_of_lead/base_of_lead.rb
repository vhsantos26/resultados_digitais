require_relative 'new_lead'

module Navbar
  class NavbarSection < SitePrism::Section
    element :leadsLink, 'a[hred="/leads"]'
    element :companyLink, 'a[href="/empresas"]'
    element :importationLink, 'a[href="/leads/importacoes"]'
  end
end

module LeadsBase
  include NewLead
  include Navbar

  class LeadsBasePage < SitePrism::Page
    set_url 'leads/'

    element :navbar_section, Navbar::NavbarSection, 'div.container-nav-pills'

    def new_lead
      NewLead::NewLeadPage.new
    end
  end
end
