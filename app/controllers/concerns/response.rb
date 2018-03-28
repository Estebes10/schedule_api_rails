# This class represent a helper method for a json response when request are made
# to each endpoint to the system.
module Response

  # Responds with JSON and an HTTP status code (ok status by default)
  def json_response(object, status = :ok)
    render json: object, status: status
  end

end
