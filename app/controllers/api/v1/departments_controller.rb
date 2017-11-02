module Api::V1

  # In this class are implemented all methods for each endpoint of the
  # Department model

  class DepartmentsController < ApplicationController

    def index
      # Get all departments
      @departments = Department.all

      # returns all Department objects
      if @departments.any?
          json_response(@departments)
      # returns errors if exists problems
      else
        json_response(@departments, :unprocessable_entity)
      end
    end

  end

end
