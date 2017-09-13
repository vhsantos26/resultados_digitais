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
