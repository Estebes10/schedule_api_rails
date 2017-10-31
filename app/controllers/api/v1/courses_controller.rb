module Api::V1

  class CoursesController < ApplicationController

    before_action :get_course,
      only: :update

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

    def update
      if @course
        if @course.update(creation_attributes)
          response = {
            message: Message.record_updated(@course.class.name),
            course: @course,
          }
          json_response(response)
        else
          json_response(@course, :unprocessable_entity)
        end
      else
        json_response(@course, :not_found)
      end
    end

    private

    def creation_attributes
      params.permit(
        :name,
        :code,
        :description,
        :units,
        :class_hours,
        :lab_hours,
        :status,
      )
    end

    # Get the course with the ID sent in the request
    def get_course
      @course = Course.find(params[:id])
    end

  end

end
