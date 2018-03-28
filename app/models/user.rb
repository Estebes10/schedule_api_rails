# This class represent a entity or object of User in the database, to store and
# validate data, perform business logic and otherwise do the heavy lifting.
class User < ApplicationRecord

  # Associations
  has_many :assignments

  has_many :roles,
    through: :assignments

  # encrypt password
  has_secure_password

  # Attributes validation
  validates :name,
    presence: true,
    length:   { maximum: 128 }

  validates :last_name,
    presence: true,
    length:   { maximum: 128 }

  validates :id_college,
    presence: true,
    length:   { maximum: 16 }

  validates :password_digest,
    presence: true

  validates :password,
    length: { maximum: 32 }

  validates :email,
    presence:   true,
    uniqueness: true,
    length:     { maximum: 64 }

  validates :phone,
    presence: true,
    length:   { maximum: 32 }

  validates :gender,
    presence: true,
    length:   { maximum: 16 }

  validates :birthday,
    presence: true

  validates :status,
    inclusion: { in: [true, false] }

  # public class methods
  def role?
    roles.any?
  end

  def role_name?
    return roles.first.name if role?
  end

end
