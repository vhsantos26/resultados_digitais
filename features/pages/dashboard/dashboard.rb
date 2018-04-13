require_relative '../sections/navbar'

module Dashboard
  class HomePage < SitePrism::Page
    element :title, '#page-header h2'
    section :navbar, Navbar::NavbarSection, '.navbar-container'
  end
end
