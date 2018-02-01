# Conversion section
class ConversionSection < SitePrism::Section
  element :event_name_input, '#source'
end

# Identification section
class IdentificationSection < SitePrism::Section
  element :name_input, '#lead_name'
  element :email_input, '#lead_email'
end

# Actions sections
class ActionsSection < SitePrism::Section
  element :save_button, 'input[type=submit]'
end

# New Lead section
class NewLeadForm < SitePrism::Page
  section :conversion_section, ConversionSection, 'div.panel-default:nth-of-type(2)'
  section :identification_section, IdentificationSection, 'div.panel-default:nth-of-type(3)'
  section :actions_section, ActionsSection, '.actions-footer'
end
