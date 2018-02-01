require_relative 'new_lead/new_lead_form'

# CRM Section
class CRMSection < SitePrism::Section
  element :insert_lead_link, '.empty-index-newlead-new'
  section :new_lead_form, NewLeadForm, 'form#new_lead'
end
