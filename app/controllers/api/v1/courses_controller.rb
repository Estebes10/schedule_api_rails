module Api::V1

  # In this class are implemented all method required for endpoints of the
  # CRUD of courses

  class CoursesController < ApplicationController

    before_action :find_course,
      only: [:show, :update, :destroy]

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

    # Get /api/v1/courses/:id
    def show
      # send the object and the total of courses associated of this record
      if @course
        json_response(@course)
      # send 404 status code when the record not exists
      else
        json_response(@course, :not_found)
      end
    end

    def create
      if @course = Course.create!(creation_attributes)
        response = {
          message: Message.record_created(@course.class.name),
          course: @course,
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

    def destroy
      if @course
        if !assigned_course(@course)
          if @course.destroy
            head :ok
          end
        else
          response = {
            message: Message.assigned(@course.class.name),
            course: @course,
          }
          json_response(response, :conflict)
        end
      else
        head :not_found
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
        { :courses => [:course_id, :attribute_id] }
      )
    end

    # Get the course with the ID sent in the request
    def find_course
      @course = Course.find(params[:id])
    end

    def assigned_course(course)
      return true if StudyProgramCourse.find_by(course_id: course.id)
    end

  end

end
