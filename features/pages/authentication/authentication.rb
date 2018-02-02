module App
  module Pages
    module Authentication
      module Login
        class IndexPage < SitePrism::Page
          set_url 'login/'
          element :email_input, 'input[type=email]'
          element :password_input, 'input[type=password]'
          element :login_button, '.auth0-lock-submit'

          def log_in(email, password)
            email_input.set email
            password_input.set password
            login_button.click
          end
        end
      end

      module Logout
        class IndexPage < SitePrism::Page
          set_url '/logout'
        end
      end
    end
  end
end
