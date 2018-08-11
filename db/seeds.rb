# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create the roles by default on the system
load File.expand_path('../seeds/roles.rb', __FILE__)
puts "===============================# Roles loaded #==============================="

# Create the courses for one study program
load File.expand_path('../seeds/courses.rb', __FILE__)
puts "=============================# Courses loaded #==============================="

# Creates records of campus and departments for development environment
load File.expand_path('../seeds/departments.rb', __FILE__)
puts "============================# Departments loaded #============================"

# Creates records of users for development environment
load File.expand_path('../seeds/users.rb', __FILE__)
puts "===============================# Users loaded #==============================="

# Creates the default attributes for the courses
load File.expand_path('../seeds/attributes.rb', __FILE__)
puts "============================# Attributes loaded #============================="
