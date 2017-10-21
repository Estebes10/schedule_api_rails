class User < ApplicationRecord

  # Associations
  has_many :assignments
  has_many :roles, through: :assignments

  # encrypt password
  has_secure_password

  # Attributes validatation
  validates :name,
    presence: true,
    length:   { maximum: 64 }

  validates :last_name,
    presence: true,
    length:   { maximum: 64 }

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
    inclusion: { in: [ true, false ] }

  def role?
    roles.any?
  end

  def role_name?
    return roles.first.name if role?
  end

end
