# This class represent the association between User and Role assigned in
# the database, to store and validate data, perform business logic and otherwise
# do the heavy lifting.
class Assignment < ApplicationRecord

  # Associations
  belongs_to :user

  belongs_to :role

end
