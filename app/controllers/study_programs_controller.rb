# This class has the method needed to get all study programs in the database
# to use in the public page for signup a new student
#
# Author:: Juan Carlos Estebes <jhon10njc@gmail.com>
class StudyProgramsController < ApplicationController

  # skip authorization request to users who are trying to create their account
  skip_before_action :authorize_request

  before_action :find_career

  def index
    @study_programs = @career.study_programs
    if @study_programs.any?
      json_response(@study_programs)
    else
      head :no_content
    end
  end

  private

  def find_career
    @career = Career.find(params[:career_id])
  end

end
