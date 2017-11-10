class StudyProgram < ApplicationRecord

  # Associations
  has_many :course_programs

  has_many :courses,
    through: :course_programs

  belongs_to :career

  has_many :semesters

  # Attributes validation
  validates :name,
    presence:   true,
    length:     { maximum: 128 },
    uniqueness: true

  validates :description,
    length: { maximum: 512 }

  validates :status,
    inclusion: { in: [true, false] }

end
