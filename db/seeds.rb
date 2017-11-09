# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create the roles by default on the system
load File.expand_path('../seeds/roles.rb', __FILE__)

# Creates records of campus and departments for development environment
load File.expand_path('../seeds/departments.rb', __FILE__)

# Creates records of users for development environment
load File.expand_path('../seeds/users.rb', __FILE__)
