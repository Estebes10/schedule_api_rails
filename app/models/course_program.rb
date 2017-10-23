class CourseProgram < ApplicationRecord

  # Associations
  belongs_to :study_program
  belongs_to :course

end
