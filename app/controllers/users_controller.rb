class UsersController < ApplicationController

  # skip authorization request to users who are trying to create their account
  skip_before_action :authorize_request, only: :create

  # POST /signup
  # return authenticated token upon signup
  def create
    # Create the user if valid attributes are given
    if user = User.create!(user_params)
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      json_response(response, :created)
      role = Role.find_by(code: 'estudiante')
      Assignment.create(role: role, user: user)
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

end
