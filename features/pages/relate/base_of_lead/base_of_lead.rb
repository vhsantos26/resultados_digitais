require_relative '../../sections/feedback'

module NewLead
  include Feedback

  class ConversionSection < SitePrism::Section
    element :lead_event_name, 'input#source'
  end

  class IdentificationSection < SitePrism::Section
    element :lead_name, 'input#lead_name'
    element :lead_email, 'input#lead_email'
  end

  class FooterSection < SitePrism::Section
    element :save, 'input[type=submit]'
  end

  class NewLeadPage < SitePrism::Page
    set_url 'leads/novo'
    section :conversionSection, ConversionSection, 'div.panel-default:nth-of-type(1)'
    section :identificationSection, IdentificationSection, 'div.panel-default:nth-of-type(2)'
    section :footerSection, FooterSection, 'div.actions-footer'
    section :alert_message, Feedback::MessagesSection, '.bootstrap-growl, div[alert-danger]'
  end
end

module LeadsBase
  include NewLead

  class NavbarSection < SitePrism::Section
    element :leadsLink, 'a[hred="/leads"]'
    element :companyLink, 'a[href="/empresas"]'
    element :importationLink, 'a[href="/leads/importacoes"]'
  end

  def new_lead
    NewLead::NewLeadPage.new
  end
end
