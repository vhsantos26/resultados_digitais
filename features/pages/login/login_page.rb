class LoginPage < SitePrism::Page
    set_url "login/"

    element :email_input, "#user_email"
    element :password_input, "#user_password"
    element :login_button, ".signin-button"

    def log_in email, password
        email_input.set email
        password_input.set password
        login_button.click
    end
end
