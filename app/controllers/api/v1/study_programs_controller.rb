module Api::V1

  # In this class are implemented all methods associated with the CRUD of
  # Study Program model

  class StudyProgramsController < ApplicationController

    before_action :find_career

    before_action :find_study_program,
      only: [:show, :update, :destroy, :assign_course]

    before_action :find_course,
      only: [:assign_course]

    def index
      # Get all study programs
      @study_programs = @career.study_programs

      # returns all studyPrograms objects
      if @study_programs
          json_response(@study_programs)
      # returns errors if exists problems
      else
        json_response(@study_programs, :unprocessable_entity)
      end
    end

    # GET /study_programs/:id
    def show
      # send the object and the total of courses associated of this record
      if @study
        response = {
          study_program: @study,
          courses: @study.courses.count,
        }
        json_response(response)
      # send 404 when the ID not exists
      else
        json_response(@study, :not_found)
      end
    end

    def create
      if @study_program = @career.study_programs.create!(creation_attributes)
        response = {
          message: Message.record_created(@study_program.class.name),
          study_program: @study_program,
        }
        json_response(response, :created)
      else
        json_response(@study_program, :unprocessable_entity)
      end
    end

    def update
      if @study
        if @study.update(creation_attributes)
          response = {
            message: Message.record_updated(@study.class.name),
            study_program: @study,
          }
          json_response(response)
        else
          json_response(@study, :unprocessable_entity)
        end
      else
        json_response(@study, :not_found)
      end
    end

    # DELETE /study_programs/:id
    def destroy
      if @study
        if @study.destroy
          head :ok
        end
      else
        head :not_found
      end
    end

    # DELETE /study_programs/:id/assign_course
    def assign_course
      if @assign = StudyProgramCourse.create!(assign_attributes)
        response = {
          message: Message.successfully_assigned(@course.class.name, @study.class.name),
          assign: @assign,
        }
        json_response(response, :ok)
      else
        json_response(@assign, :unprocessable_entity)
      end
    end

    private

    def creation_attributes
      params
        .require(:study_program)
        .permit(
          :name,
          :description,
          :status,
          :career_id
        )
    end

    def assign_attributes
      params.permit(
        :course_id,
        :study_program_id,
        :semester_number
      )
    end

    # find current study program
    def find_study_program
      @study = @career.study_programs.find_by!(id: params[:id]) if @career
    end

    # find current study program
    def find_career
      @career = Career.find(params[:career_id])
    end

    # find course to be assigned
    def find_course
      @course = Course.find(params[:course_id])
    end

  end

end
