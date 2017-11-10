class Semester < ApplicationRecord

  # Associations
  belongs_to :study_program

  # Attributes validation
  validates :semester_number,
    presence:   true,
    uniqueness: true

  validates :status,
    inclusion: { in: [true, false] }

end
