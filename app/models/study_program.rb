class StudyProgram < ApplicationRecord

  # Associations
  has_many :course_programs
  has_many :courses, through: :course_programs

  # Attributes validatation
  validates :name,
    presence:   true,
    length:     { maximum: 32 },
    uniqueness: true

  validates :description,
    length: { maximum: 64 }

  validates :status,
    inclusion: { in: [true, false] }

  validates :total_courses,
    presence: true

end
