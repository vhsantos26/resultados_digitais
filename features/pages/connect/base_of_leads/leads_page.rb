class LeadsPage < SitePrism::Page
    set_url "leads/"

    element :leads_tab, :link, "Leads"
    element :company_tab, :link, "Empresas"
    element :import_tab, :link, "Importações"
    element :import_leads, :link, "Importar Leads"
    element :action_options, ".btn.btn-primary.dropdown-toggle"
    element :insert_lead, :link, "Inserir Lead"
    element :insert_company, :link, "Inserir empresa"
    element :custom_fields, :link, "Campos personalizados"
    element :export_leads_table, :link, "Exportar tabela de Leads"
    element :search_input, ".tt-query"
    elements :edit_lead, ".edit-info-link"

    def click_on_insert_lead
        action_options.click
        wait_until_insert_lead_visible
        insert_lead.click
    end

    def click_on_insert_company
        action_options.click
        wait_until_insert_company_visible
        insert_company.click
    end

    def click_on_custom_fields
        action_options.click
        wait_until_custom_fields_visible
        custom_fields.click
    end

    def click_on_export_leads_table
        action_options.click
        wait_until_export_leads_table_visible
        export_leads_table.click
    end

    def search_lead lead_info
        search_input.set lead_info
        search_input.send_keys(:enter)
    end
end
