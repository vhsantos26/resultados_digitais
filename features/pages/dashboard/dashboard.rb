require_relative '../sections/navbar'

module App
  module Pages
    module Dashboard
      class IndexPage < SitePrism::Page
        element :title, '#page-header h2'
        section :navbar, App::Sections::Layouts::Shared::Navbar, '.navbar-container'
      end
    end
  end
end
