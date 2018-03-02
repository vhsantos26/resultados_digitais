module App
  module Sections
    module Layouts
      module Shared
        class FooterSections < SitePrism::Section
          element :save_button, 'input[name=commit]'
        end
      end
    end
  end
end
