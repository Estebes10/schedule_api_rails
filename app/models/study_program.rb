class StudyProgram < ApplicationRecord

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
