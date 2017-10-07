# This class will be responsible for authenticating users via email and password.
class AuthenticateUser

  # class initilization
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    # encode if user exits
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end

end
