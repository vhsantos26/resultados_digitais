class NewLead < SitePrism::Page
    element :event_name, "#source"

    element :lead_name, "#lead_name"
    element :lead_email, "#lead_email"
    element :lead_job_title, "#lead_job_title"

    element :lead_info_phone, "#lead_lead_info_attributes_personal_phone"
    element :lead_info_cell_phone, "##lead_lead_info_attributes_mobile_phone"
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

    def fill_in_all_leads_information
        new_lead_email = Faker::Internet.unique.email

        lead_name.set Fake::Name::name
        lead_email.set new_lead_email
        lead_job_title.set Faker::Job.title

        lead_info_phone.set Faker::PhoneNumber.phone_number
        lead_info_cell_phone.set Faker::PhoneNumber.cell_phone
        lead_info_site_blog.set Faker::Internet.url('info.com')
        lead_info_state.select "SC"
        lead_info_city.set "Joinville"

        lead_company_name.set Faker::Company.name
        lead_company_sector.set Faker::Company.buzzword
        lead_company_size.set Faker::Number.number(3)
        lead_company_email.set Faker::Internet.email
        lead_company_site.set  Faker::Internet.url('company.com')
        lead_company_phone.set Faker::PhoneNumber.phone_number
        lead_company_address.set Faker::Address.street_address
        
        new_lead_email
    end
end
