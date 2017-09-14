module BaseOfLeadsModule
    def self.login_page
        LoginPage.new
    end

    def self.leads_page
        LeadsPage.new
    end  

    def self.new_leads_page
        NewLeadPage.new
    end

    def self.lead_detail_page
        LeadDetailPage.new
    end

    def self.import_leads_page
        ImportLeadsPage.new
    end

    def self.edit_lead_page
        EditLeadPage.new
    end
end