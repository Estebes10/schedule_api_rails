# This class represent a entity or object of Course in the database, to store
# and validate data, this entity is a single object assigned to study programs,
# record academics and semesters.
class Course < ApplicationRecord

  # Associations
  has_many :semester_courses

  has_many :semesters,
    through: :semester_courses

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
