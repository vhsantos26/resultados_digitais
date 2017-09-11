class BaseOfLeads < SitePrism::Page
    set_url "leads/"

    element :leads_tab, :link, "Leads"
    element :company_tab, :link, "Empresas"
    element :import_tab, :link, "Importações"

    element :import_leads, :link, "Importar Leads"

    class ActionOptions < SitePrism::Section
        element :insert_lead, :link, "Inserir Lead"
        element :insert_company, :link, "Inserir empresa"
        element :custom_fields, :link, "Campos personalizados"
        element :export_leads_table, :link, "Exportar tabela de Leads"
    end

    section :action_options, ActionOptions, ".btn.btn-primary.dropdown-toggle"

    element :search_input, ".tt-query"
    elements :edit_lead, ".edit-info-link"

    element :amount_leads, ".text-muted"


end
