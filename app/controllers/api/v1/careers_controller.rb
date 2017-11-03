module Api::V1

  class CareersController < ApplicationController

    def index
      # Get all careers
      @careers = Career.all

      # returns all Career objects
      if @careers.any?
          json_response(@careers)
      # returns errors if exists problems
      else
        json_response(@careers, :unprocessable_entity)
      end
    end

    def create
      if @career = Career.create!(creation_attributes)
        response = {
          message: Message.record_created(@career.class.name),
          career: @career
        }
        json_response(response, :created)
      else
        json_response(@career, :unprocessable_entity)
      end
    end

    private

    def creation_attributes
      params.permit(
        :name,
        :code,
        :description,
        :status,
        :department_id,
      )
    end

  end

end
