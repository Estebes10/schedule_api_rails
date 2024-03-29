# This class represent a entity or object of Campus in the database is the upper
# class in the system to group other objects in the system.
class Campu < ApplicationRecord

  # Associations
  has_many :departments

  # Attributes validation
  validates :name,
    uniqueness: true,
    presence:   true,
    length:     { maximum: 128 }

  validates :code,
    uniqueness: true,
    presence:   true,
    length:     { maximum: 32 }

  validates :description,
    length: { maximum: 512 }

  validates :state,
    presence: true,
    length:   { maximum: 64 }

  validates :status,
    inclusion: { in: [true, false] }

end
