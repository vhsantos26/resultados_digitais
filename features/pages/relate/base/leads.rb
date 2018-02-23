require_relative 'crm/crm_section'

module App
  module Pages
    module BaseOfLead
      class IndexPage < SitePrism::Page
        set_url '/leads'
      end
    end
  end
end

class Leads < SitePrism::Page
  set_url '/leads'
  section :crm_section, CRMSection, 'div#leads_crm'
end
