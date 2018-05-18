require_relative '../../sections/feedback'

module NewLead
  include Feedback

  class ConversionSection < SitePrism::Section
    element :event_name, 'input#source'
  end

  class IdentificationSection < SitePrism::Section
    element :name, 'input#lead_name'
    element :email, 'input#lead_email'
    element :job, 'input#lead_job_title'
  end

  class ContactSection < SitePrism::Section
    element :peronal_phone_number, 'input#lead_lead_info_attributes_personal_phone'
    element :mobile_phone_number, 'input#lead_lead_info_attributes_mobile_phone'
    element :twitter_id, 'input#lead_lead_info_attributes_twitter'
    element :facebook_id, 'input#lead_lead_info_attributes_facebook'
    element :linkedin_id, 'input#lead_lead_info_attributes_linkedin'
    element :website_url, 'input#lead_lead_info_attributes_website'
    element :state, 'select#inputUfTitle'
  end

  class CompanySection < SitePrism::Section
    element :name, 'input#lead_event_name'
    element :sector, 'select#lead_company_attributes_company_sector_id'
    element :size, 'select#lead_company_attributes_size'
    element :email, 'input#lead_company_attributes_email'
    element :website_url, 'input#lead_company_attributes_site'
    element :twitter_id, 'input#lead_company_attributes_twitter'
    element :facebook_id, 'input#lead_company_attributes_facebook'
    element :phone_number, 'input#lead_company_attributes_phone'
    element :address, 'input#lead_company_attributes_address'
  end

  class AdditionalInformationSection < SitePrism::Section
    element :lead_owner, 'select#lead_user_id'
    element :bio, 'input#lead_bio'
  end

  class FooterSection < SitePrism::Section
    element :save, 'input[type=submit]'
    element :cancel, 'a.btn-link'
  end

  class NewLeadPage < SitePrism::Page
    set_url 'leads/novo'
    section :conversion_section, ConversionSection, 'div.panel-default:nth-of-type(2)'
    section :identification_section, IdentificationSection, 'div.panel-default:nth-of-type(3)'
    section :contact_section, ContactSection, 'div.panel-default:nth-of-type(4)'
    section :company_section, CompanySection, 'div.panel-default:nth-of-type(5)'
    section :footer_section, FooterSection, 'div.actions-footer'
    section :alert_message, Feedback::MessagesSection, '.bootstrap-growl, div[alert-danger]'
  end
end
