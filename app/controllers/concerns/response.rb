module Response

  # Responds with JSON and an HTTP status code (ok status by default)
  def json_response(object, status = :ok)
    render json: object, status: status
  end

end
