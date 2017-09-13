class ImportLeadsPage < SitePrism::Page
    element :load_list_import_file_button, "#file"
    element :load_list_know_to_make_a_csv_button, ".evergage-import-help-center"
    element :load_list_download_csv_example, :link, "ou baixe um exemplo"
    element :load_list_policies, "#politics_confirm"
    element :load_list_plan_update, "#plan_update_confirm"
    element :load_list_responsible, "#responsible_confirm"
    element :load_list_import_reason, "#lead_import_import_reason"
    element :load_list_confirm_button, "#js-confirm-import"
    element :load_list_cancel_button, :link, "Cancelar"
    element :combine_fields_cancel_button, :link, "Cancelar"
    element :combine_fields_save_and_exit_button, ".evergage-import-save-and-exit"
    element :combine_fields_save_and_proceed_button, "#js-save-and-proceed"
    element :conversion_option_false, ".js-create-conversion-false"
    element :conversion_option_true, ".js-create-conversion-true"
    element :conversion_date, "#lead_import_conversion_date"
    element :conversion_name, "#lead_import_name"
    element :conversion_cancel_button, :link, "Cancelar"
    element :conversion_save_and_exit_button, ".evergage-import-save-and-exit"
    element :conversion_import_button, "#js-import"

    def accept_all_terms_and_select_a_reason reason
        load_list_policies.click unless load_list_policies.checked?
        load_list_plan_update.click
        load_list_responsible.click
        load_list_import_reason.set reason
    end

    def generate_conversion_and_import conversion = false
        conversion ? conversion_option_true.ckick : conversion_option_false.click
        save_and_proceed_button.click
    end
end
