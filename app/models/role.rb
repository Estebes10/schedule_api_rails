class Role < ApplicationRecord

  validates :name,
    presence:  true,
    length:    { maximum: 32 },
    uniqueness: true

  validates :description,
    presence: true,
    length:   { maximum: 64 }

  validates :status,
    inclusion: { in: [true, false] }

end