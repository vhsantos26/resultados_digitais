class NewLeadPage < SitePrism::Page
    element :event_name, "#source"
    element :lead_name, "#lead_name"
    element :lead_email, "#lead_email"
    element :lead_job_title, "#lead_job_title"
    element :lead_info_phone, "#lead_lead_info_attributes_personal_phone"
    element :lead_info_cell_phone, "#lead_lead_info_attributes_mobile_phone"
    element :lead_info_site_blog, "#lead_lead_info_attributes_website"
    element :lead_info_state, "#inputUfTitle"
    element :lead_company_name, "#lead_company_attributes_name"
    element :lead_company_sector, "#lead_company_attributes_company_sector_id"
    element :lead_company_size, "#lead_company_attributes_size"
    element :lead_company_email, "#lead_company_attributes_email"
    element :lead_company_site, "#lead_company_attributes_site"
    element :lead_company_phone, "#lead_company_attributes_phone"
    element :lead_company_address, "#lead_company_attributes_address"
    element :save_button, "input[name='commit']"

    def fill_in_all_leads_information new_lead_name
        lead_name.set new_lead_name
        lead_email.set Faker::Internet.unique.email
        lead_job_title.set Faker::Job.title
        lead_info_phone.set Faker::Number.number(8)
        lead_info_cell_phone.set Faker::PhoneNumber.cell_phone
        lead_info_site_blog.set Faker::Internet.url('info.com')
        lead_info_state.select "SC"
        lead_company_name.set Faker::Company.name
        lead_company_sector.select "Tecnologia"
        lead_company_size.select "51-200"
        lead_company_email.set Faker::Internet.email
        lead_company_site.set  Faker::Internet.url('company.com')
        lead_company_phone.set Faker::PhoneNumber.phone_number
        lead_company_address.set Faker::Address.street_address
    end
end
