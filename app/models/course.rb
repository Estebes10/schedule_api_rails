# This class represent a entity or object of Course in the database, to store
# and validate data, this entity is a single object assigned to study programs,
# record academics and semesters, using study programs table between both
# tables.
class Course < ApplicationRecord

  # Associations
  has_many :study_program_courses

  has_many :study_programs,
    through: :study_program_courses

  # Attributes validation
  validates :name,
    presence:   true,
    length:     { maximum: 128 },
    uniqueness: true

  validates :code,
    presence:   true,
    length:     { maximum: 16 },
    uniqueness: true

  validates :description,
    length: { maximum: 512 }

  validates :units,
    presence: true

  validates :class_hours,
    presence: true

  validates :lab_hours,
    presence: true

  validates :status,
    inclusion: { in: [true, false] }

end
