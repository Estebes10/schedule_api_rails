class User < ApplicationRecord

  validates :name,
    presence: true,
    length:   { maximum: 64 }

  validates :last_name,
    presence: true,
    length:   { maximum: 64 }

  validates :password_digest,
    presence: true,
    length:   { maximum: 32 }

  validates :email,
    presence: true,
    length:   { maximum: 64 }

  validates :phone,
    presence: true,
    length:   { maximum: 64 }

  validates :gender,
    presence: true,
    length:   { maximum: 16 }

  validates :birthday,
    presence: true

  validates :status,
    inclusion: { in: [ true, false ] }

end
