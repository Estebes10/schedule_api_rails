module Api::V1

  class CareersController < ApplicationController

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

  end

end
