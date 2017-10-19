class UsersController < ApplicationController

  # skip authorization request to users who are trying to create their account
  skip_before_action :authorize_request, only: :create

  before_action :get_student_role,
    only: :create

  after_action :create_assigment,
    only: :create

  # POST /signup
  # return authenticated token upon signup
  def create
    # Create the user if valid attributes are given
    if @user = User.create!(user_params)
      auth_token = AuthenticateUser.new(@user.email, @user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      json_response(response, :created)
    else
      json_response(response, :unprocessable_entity)
    end

  end

  private

  def user_params
    # all params that are required to crated a new user account
    params.permit(
      :name,
      :last_name,
      :email,
      :id_college,
      :phone,
      :gender,
      :password,
      :password_confirmation,
      :birthday,
      :status,
    )
  end

  # Get the student role before create Assignment
  def get_student_role
    @role = Role.find_by(code: 'Student')
  end

  # Create Assignment after save the new user
  def create_assigment
    Assignment.create(role: @role, user: @user)
  end

end
