module Feedback
  # '.bootstrap-growl, div[alert-danger]'
  class MessagesSection < SitePrism::Section
    element :alert, '.bootstrap-growl, div[alert-danger]'
  end
end
