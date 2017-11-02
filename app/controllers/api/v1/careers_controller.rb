module Api::V1

  # This class has the methods necessaries for endpoints requests required for
  # Career model

  class CareersController < ApplicationController

    # Get the career before update
    before_action :get_career,
      only: :update

    # GET /api/v1/careers/
    def index
      # Get all careers
      @careers = Career.all

      # returns all Career objects
      if @careers
          json_response(@careers)
      # returns errors if exists problems
      else
        json_response(@careers, :unprocessable_entity)
      end
    end

    # POST /api/v1/careers/
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

    # PUT /api/v1/careers/:id
    def update
      if @career
        # try to update the record with the attributes permited
        if @career.update(creation_attributes)
          response = {
            message: Message.record_updated(@career.class.name),
            career: @career,
          }
          json_response(response)
        # response with 422 if is imposible to update the career
        else
          json_response(@career, :unprocessable_entity)
        end
      # return 404 when the id of the career is not valid
      else
        json_response(@career, :not_found)
      end
    end

    private

    # attributes permited to create and update one career
    def creation_attributes
      params.permit(
        :name,
        :code,
        :description,
        :status,
        :department_id,
      )
    end

    # Get the career with the ID sent in the request
    def get_career
      @career = Career.find(params[:id])
    end

  end

end
