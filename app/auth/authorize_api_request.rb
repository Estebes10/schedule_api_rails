# The AuthorizeApiRequest service gets the token from the authorization headers,
# initialize the class with headers
# Params:
# +user_id+:: unique integer value.
#
# Author:: Juan Carlos Estebes <jhon10njc@gmail.com>
class AuthorizeApiRequest

  # class initiaization, to use this method just call .new()
  def initialize(headers = {})
    @headers = headers
  end

  # Service entry point - return valid user object
  def call
    {
      user: user,
    }
  end

  private

  attr_reader :headers

  # check if user is in the database,
  # * memoize user object
  # * raise custom error if user nt found.
  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  rescue ActiveRecord::RecordNotFound => e
    raise(
      ExceptionHandler::InvalidToken, ("#{Message.invalid_token} #{e.message}")
    )
  end

  # decode authentication token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  # check for token in `Authorization` header
  # * raise exceptions if token is not valid
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end

end
