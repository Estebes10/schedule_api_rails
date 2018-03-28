# This class represent a entity or object of Career in the database, to store
# and validate data from objects which are assigned to each student.
class Career < ApplicationRecord

  # Associations
  has_many :study_programs

  belongs_to :department

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

  validates :status,
    inclusion: { in: [true, false] }

end
