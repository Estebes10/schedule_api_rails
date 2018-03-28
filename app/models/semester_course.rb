# This class represent the association between Semester and Course assigned in
# the database, to store and validate data, perform business logic and otherwise
# do the heavy lifting.
class SemesterCourse < ApplicationRecord

  # Associations
  belongs_to :semester

  belongs_to :course

end
