module Api::V1

  # In this class are implemented all methods associated with the CRUD of
  # Study Program model

  class StudyProgramsController < ApplicationController

    before_action :set_study_program,
      only: [:show, :update, :destroy]

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

    # GET /study_programs/:id
    def show
      # send the object and the total of semesters associated of this record
      if @study
        response = {
          study_program: @study,
          semesters: @study.semesters.count,
        }
        json_response(response)
      # send 404 when the ID not exists
      else
        json_response(@study, :not_found)
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

    private

    def creation_attributes
      params.require(:study_program)
        .permit(
          :name,
          :description,
          :status,
          :career_id,
        )
    end

    def set_study_program
      @study = StudyProgram.find(params[:id])
    end

  end

end
