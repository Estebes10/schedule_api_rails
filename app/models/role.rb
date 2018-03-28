# This class represent a entity or object of Role in the database, to store
# and validate data from roles to allow be assigned to each User.
class Role < ApplicationRecord

  # Associations
  has_many :assignments

  has_many :users,
    through: :assignments

  # Attributes validation
  validates :code,
    presence:  true,
    length:    { maximum: 32 },
    uniqueness: true

  validates :name,
    presence:  true,
    length:    { maximum: 128 }

  validates :description,
    presence: true,
    length:   { maximum: 512 }

  validates :status,
    inclusion: { in: [true, false] }

end
