class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private
    def error_message(errors)
      errors.full_messages.join(', ')
    end
end
