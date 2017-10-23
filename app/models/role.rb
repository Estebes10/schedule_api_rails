class Role < ApplicationRecord

  # Associations
  has_many :assignments
  has_many :users, through: :assignments

  # Attributes validation
  validates :code,
    presence:  true,
    length:    { maximum: 32 },
    uniqueness: true

  validates :name,
    presence:  true,
    length:    { maximum: 32 }

  validates :description,
    presence: true,
    length:   { maximum: 64 }

  validates :status,
    inclusion: { in: [true, false] }

end
