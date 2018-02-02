require_relative 'crm/crm_section'

class Leads < SitePrism::Page
  set_url '/leads'
  section :crm_section, CRMSection, 'div#leads_crm'
end
