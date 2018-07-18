# This class represent the association between StudyProgram and Course assigned
# in the database, to store and validate data, perform business logic and
# otherwise do the heavy lifting.
class StudyProgramCourse < ApplicationRecord

  # Associations
  belongs_to :study_program

  belongs_to :course

  #validations
  validates :semester_number,
    presence:   true

end
