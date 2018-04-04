# Main class that contains most important features to access in the system,
# like concerns and session methods.
#
# Autor:: Juan Carlos Estebes <jhon10njc@gmail.com>
class ApplicationController < ActionController::API

  # Include concerns files and their methods for all controllers that inherit
  # from ApplicationController
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request

  attr_reader :current_user

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = AuthorizeApiRequest.new(request.headers).call[:user]
  end

end
