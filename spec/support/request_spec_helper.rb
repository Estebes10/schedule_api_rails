# This class implements helper methods to parse JSON response in specs.
module RequestSpecHelper

  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

end
