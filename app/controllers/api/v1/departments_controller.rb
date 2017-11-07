module Api::V1

  # In this class are implemented all methods for each endpoint of the
  # Department model

  class DepartmentsController < ApplicationController

    # get the department before update
    before_action :get_department,
      only: :update

    # GET /api/v1/departments
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

    # PUT api/v1/departments/:id
    def update
      if @department
        if @department.update(creation_attributes)
          response = {
            message: Message.record_updated(@department.class.name),
            department: @department,
          }
          json_response(response)
        else
          json_response(@department, :unprocessable_entity)
        end
      else
        json_response(@department, :not_found)
      end
    end

    private

    # attributes permited to create and update one department
    def creation_attributes
      params.permit(
        :name,
        :code,
        :description,
        :status,
        :campu_id,
      )
    end

    # find the department with the ID sent in request
    def get_department
      @department = Department.find(params[:id])
    end

  end

end
