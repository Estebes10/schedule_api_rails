# This class returns a message to authentication request
class Message

  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.account_created
    'Account created successfully'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.expired_token
    'Sorry, your token has expired. Please login to continue.'
  end

  def self.signature_has_expired
    'Signature has expired'
  end

  def self.record_created(record = 'record')
    "Great, the #{record} was created successfully"
  end

  def self.record_not_created(record = 'Object requested')
    "Sorry, the #{record} could not be created"
  end

  def self.empty
    "No records found"
  end

end
