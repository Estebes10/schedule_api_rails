class User < ApplicationRecord

  # encrypt password
  has_secure_password

  validates :name,
    presence: true,
    length:   { maximum: 64 }

  validates :last_name,
    presence: true,
    length:   { maximum: 64 }

  validates :id_collegue,
    presence: true,
    length:   { maximum: 16 }

  validates :password_digest,
    presence: true,
    length:   { maximum: 32 }

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

end
