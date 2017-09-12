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

class NewLeadPage < SitePrism::Page
    element :event_name, "#source"
    element :lead_name, "#lead_name"
    element :lead_email, "#lead_email"
    element :lead_job_title, "#lead_job_title"
    element :lead_info_phone, "#lead_lead_info_attributes_personal_phone"
    element :lead_info_cell_phone, "#lead_lead_info_attributes_mobile_phone"
    element :lead_info_twitter, "#lead_lead_info_attributes_twitter"
    element :lead_info_facebook, "#lead_lead_info_attributes_facebook"
    element :lead_info_linkedin, "#lead_lead_info_attributes_linkedin"
    element :lead_info_site_blog, "#lead_lead_info_attributes_website"
    element :lead_info_state, "#inputUfTitle"
    element :lead_info_city, "inputCity"
    element :lead_company_name, "#lead_company_attributes_name"
    element :lead_company_sector, "#lead_company_attributes_company_sector_id"
    element :lead_company_size, "#lead_company_attributes_size"
    element :lead_company_email, "#lead_company_attributes_email"
    element :lead_company_site, "#lead_company_attributes_site"
    element :lead_company_twitter, "#lead_company_attributes_twitter"
    element :lead_company_facebook, "#lead_company_attributes_facebook"
    element :lead_company_phone, "#lead_company_attributes_phone"
    element :lead_company_address, "#lead_company_attributes_address"
    element :lead_owner, "#lead_user_id"
    element :lead_bio, "lead_bio"
    element :save_button, "input[name='commit']"

    def fill_in_all_leads_information new_lead_name
        lead_name.set new_lead_name
        lead_email.set Faker::Internet.unique.email
        lead_job_title.set Faker::Job.title
        lead_info_phone.set Faker::PhoneNumber.phone_number
        lead_info_cell_phone.set Faker::PhoneNumber.cell_phone
        lead_info_site_blog.set Faker::Internet.url('info.com')
        lead_info_state.select "SC"
        lead_company_name.set Faker::Company.name
        lead_company_sector.set Faker::Company.buzzword
        lead_company_size.set Faker::Number.number(3)
        lead_company_email.set Faker::Internet.email
        lead_company_site.set  Faker::Internet.url('company.com')
        lead_company_phone.set Faker::PhoneNumber.phone_number
        lead_company_address.set Faker::Address.street_address
    end
end

class LeadDetailPage < SitePrism::Page
    element :lead_name, "#lead-name"
    element :lead_job, "#lead-job-title"
    element :lead_life_cycle, "#lead-lifecycle-stage"
    element :lead_owner, "#lead-owner"
    element :edit_lead, ".lead-edit"
    element :action_options, ".btn.btn-default.dropdown-toggle"
    element :match_lead, :link, "Combinar"
    element :remove_lead, :link, "Apagar Lead"

    def click_on_match_lead
        action_options.click
        wait_until__match_lead_visible
        match_lead.click
    end

    def click_on_remove_lead
        action_options.click
        wait_until_remove_lead_visible
        remove_lead.click
    end
end
