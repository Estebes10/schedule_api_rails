source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.5'

# Use postgres as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Manage JSON Web tokens
gem 'jwt'

# Custom representation of json
gem 'active_model_serializers', '~> 0.10.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# DSL and Rails engine for documenting RESTful API
gem 'apipie-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  # Test controllers, models, views and apis
  gem 'rspec-rails', '~> 3.5'

  # This gem brings back assigns to your controller tests as well as
  # assert_template to both controller and integration tests
  gem 'rails-controller-testing'

  # Fixtures replacement with a straightforward definition syntax
  gem 'factory_bot_rails', '~> 4.0'

  # Generate fake data
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
