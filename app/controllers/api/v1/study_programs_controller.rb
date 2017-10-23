module Api::V1

  class StudyProgramsController < ApplicationController

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
          :total_courses,
          :status,
        )
    end

  end

end
