module Api::V1

  class StudyProgramsController < ApplicationController

    def index
      # Get all study programs
      @study_programs = StudyProgram.all

      # returns all studyPrograms objects
      if @study_programs
          json_response(@study_programs)
      # returns errors if exists problems
      else
        json_response(@study_programs, :unprocessable_entity)
      end
    end

    def create

      if @study_program = StudyProgram.create!(creation_attributes)
        response = {
          message: Message.record_created(@study_program.class.name),
          study_program: @study_program
        }
        json_response(response, :created)
      else
        json_response(@study_program, :unprocessable_entity)
      end

    end

    private

    def creation_attributes
      params.require(:study_program)
        .permit(
          :name,
          :description,
          :status,
        )
    end

  end

end
