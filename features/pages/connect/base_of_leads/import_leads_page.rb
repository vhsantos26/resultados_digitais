class ImportLeadsPage < SitePrism::Page

    element :import_file, "input[type='file']"

    class ConfirmStepSection < SitePrism::Section
        element :policies_checkbox, "#politics_confirm"
        element :plan_update_checkbox, "#plan_update_confirm"
        element :responsible_checkbox, "#responsible_confirm"
        element :import_reason, "#lead_import_import_reason"
        element :confirm_button, "#js-confirm-import"

        def accept_all_terms
            policies_checkbox.click unless policies_checkbox.checked?
            plan_update_checkbox.click
            responsible_checkbox.click
        end
    end

    section :confirm_step_section, ConfirmStepSection, ".js-step-1-confirm"
    element :save_and_proceed_button, "#js-save-and-proceed"

    class ConversionStepSection < SitePrism::Section
        element :conversion_option_false, ".js-create-conversion-false"
        element :conversion_option_true, ".js-create-conversion-true"
        element :conversion_name, "#lead_import_name"

        def generate_conversion options = {:conversion => false}
            options[:conversion] ? conversion_option_true.click : conversion_option_false.click
        end
    end

    section :conversion_step_section, ConversionStepSection, ".js-step-3"
    element :import_button, "#js-import"
    elements :import_list_status, "table[id='table-leadimport-index'] > tbody > tr"
end
