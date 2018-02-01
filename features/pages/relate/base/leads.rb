require_relative 'crm/crm_section'

# Base of Leads page
class Leads < SitePrism::Page
  set_url '/leads'
  section :crm_section, CRMSection, 'div#leads_crm'
end
