class SemesterCourse < ApplicationRecord

  # Associations
  belongs_to :semester

  belongs_to :course

end
