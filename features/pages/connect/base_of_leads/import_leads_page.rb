class ImportLeadsPage < SitePrism::Page
    element :load_list_import_file, "input[type='file']"
    element :load_list_policies, "#politics_confirm"
    element :load_list_plan_update, "#plan_update_confirm"
    element :load_list_responsible, "#responsible_confirm"
    element :load_list_import_reason, "#lead_import_import_reason"
    element :load_list_confirm_button, "#js-confirm-import"
    element :combine_fields_save_and_proceed_button, "#js-save-and-proceed"
    element :conversion_option_false, ".js-create-conversion-false"
    element :conversion_option_true, ".js-create-conversion-true"
    element :conversion_date, "#lead_import_conversion_date"
    element :conversion_name, "#lead_import_name"
    element :conversion_import_button, "#js-import"
    elements :import_list_status, "table[id='table-leadimport-index'] > tbody > tr"

    def accept_all_terms
        load_list_policies.click unless load_list_policies.checked?
        load_list_plan_update.click
        load_list_responsible.click
    end

    def generate_conversion options = {:conversion => false}
        options[:conversion] ? conversion_option_true.click : conversion_option_false.click
    end
end
