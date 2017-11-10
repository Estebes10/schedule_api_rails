class Course < ApplicationRecord

  # Associations
  has_many :semester_courses

  has_many :semesters,
    through: :semester_courses

  has_many :course_programs

  has_many :study_programs,
    through: :course_programs

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
