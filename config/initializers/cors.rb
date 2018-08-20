# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins 'example.com'
#
#     resource '*',
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:4200', 'https://juangro.github.io/Schedule-Front-End',
      'https://schedule-e0f93.firebaseapp.com', 'https://schedule-front-end.herokuapp.com/'

    resource '*',
      headers: :any,
      methods: %i(get post put patch delete options head)
  end
=begin
  allow do
    origins 'https://juangro.github.io/Schedule-Front-End'

    resource '*',
      headers: :any,
      methods: %i(get post put patch delete options head)
  end

  allow do
    origins 'https://schedule-e0f93.firebaseapp.com'

    resource '*',
      headers: :any,
      methods: %i(get post put patch delete options head)
  end

  allow do
    origins 'https://schedule-front-end.herokuapp.com/'

    resource '*',
      headers: :any,
      methods: %i(get post put patch delete options head)
  end
=end
end
