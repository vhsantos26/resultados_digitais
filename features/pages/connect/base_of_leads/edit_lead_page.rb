class EditLeadPage < SitePrism::Page
    element :lead_funnel_stage, "#lead_lifecycle_stage"
    element :save_button, "div[class='actions-footer'] div > input[value='Salvar']"
end