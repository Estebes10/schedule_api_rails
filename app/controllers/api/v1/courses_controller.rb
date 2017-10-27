module Api::V1

  class CoursesController < ApplicationController

    def index
      # Get all courses
      @courses = Course.all

      # returns all Course objects
      if @courses
          json_response(@courses)
      # returns errors if exists problems
      else
        json_response(@courses, :unprocessable_entity)
      end
    end

    def create

      if @course = Course.create!(creation_attributes)
        response = {
          message: Message.record_created(@course.class.name),
          course: @course
        }
        json_response(response, :created)
      else
        json_response(@course, :unprocessable_entity)
      end

    end

    private

    def creation_attributes
      params.require(:course)
        .permit(
          :name,
          :code,
          :description,
          :units,
          :class_hours,
          :lab_hours,
          :status,
        )
    end

  end

end
