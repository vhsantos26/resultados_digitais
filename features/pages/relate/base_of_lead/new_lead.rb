require_relative 'sections/footer'

module App
  module Pages
    module NewLead
      module Conversion
        class IndexPage < SitePrism::Page
          element :event_name, 'input#source'
        end
      end
      module Identification
        class IndexPage < SitePrism::Page
          element :lead_name, 'input#lead_name'
          element :lead_email, 'input#lead_email'
          element :lead_job_title, 'input#lead_job_title'

          def fill_in_identification(email, name = nil, job_title = nil)
            lead_name.set name
            lead_email.set email
            lead_job_title.set job_title
          end
        end
      end
      module Sections
        class Footer < SitePrism::Page
          section :footer, App::Sections::Layouts::Shared::FooterSections, 'div.actions-footer'
        end
      end
    end
  end
end
