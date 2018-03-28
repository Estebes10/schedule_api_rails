# This class represent a entity or object of Study Program in the database,
# to store and validate data, perform business logic and otherwise do the heavy
# lifting.
class StudyProgram < ApplicationRecord

  # Associations
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
