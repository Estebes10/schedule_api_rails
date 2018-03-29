# This class has the method needed to get all careers in the database to use
# in the public page for signup a new student
#
# Author:: Juan Carlos Estebes <jhon10njc@gmail.com>
class CareersController < ApplicationController

  # skip authorization request to users who are trying to create their account
  skip_before_action :authorize_request

  def index
    @careers = Career.all
    if @careers.any?
      json_response(@careers)
    else
      head :no_content
    end
  end

end
