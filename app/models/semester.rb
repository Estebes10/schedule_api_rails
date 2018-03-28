# This class represent a entity or object of Semester in the database, to store
# and validate data, perform business logic and otherwise do the heavy lifting.
class Semester < ApplicationRecord

  # Associations
  has_many :semester_courses

  has_many :courses,
    through: :semester_courses

  belongs_to :study_program

  # Attributes validation
  validates :semester_number,
    presence:   true,
    uniqueness: true

  validates :status,
    inclusion: { in: [true, false] }

end
