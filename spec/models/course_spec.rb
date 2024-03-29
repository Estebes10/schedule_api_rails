# This file implements a suit of tests to check associations, validations and
# methods in Course Model.
require 'rails_helper'

RSpec.describe Course, type: :model do

  subject(:course) do
    # Returns a Course instance that's not saved
    FactoryBot.build(:course)
  end

  # Test for all valid attributes are given
  it 'is valid if the name, description, code, units, class_hours, lab_hours' \
     ' status are given' do
    expect(course).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    course.name = nil

    expect(course).not_to be_valid
  end

  it 'is not valid without a code' do
    course.code = nil

    expect(course).not_to be_valid
  end

  it 'is not valid without a units' do
    course.units = nil

    expect(course).not_to be_valid
  end

  it 'is not valid without a class_hours' do
    course.class_hours = nil

    expect(course).not_to be_valid
  end

  it 'is not valid without a lab_hours' do
    course.lab_hours = nil

    expect(course).not_to be_valid
  end

  it 'is not valid without a status' do
    course.status = nil

    expect(course).not_to be_valid
  end

  # Tests for attributes that can be null
  it 'is valid without associated courses (restriccions o sugestions)' do
    course.courses = nil

    expect(course).to be_valid
  end

  # Tests for array attributes
  it 'is valid if has an array of courses (restriccions o sugestions)' do
    @course = FactoryBot.create(:course)
    @attribute = FactoryBot.create(:attribute)
    @courses = [{course_id: @course.id, attribute_id: @attribute.id}]
    course.courses = @courses

    expect(course).to be_valid
  end

  # Set of tests to validate the length for each attribute
  it 'is not valid if the name given contains more than 128 characters' do
    course.name = 'a' * 129

    expect(course).not_to be_valid
  end

  it 'is not valid if the code given contains more than 16 characters' do
    course.code = 'a' * 17

    expect(course).not_to be_valid
  end

  it 'is not valid if description given contains more than 512 characters' do
    course.description = 'a' * 513

    expect(course).not_to be_valid
  end

  # validate uniqueness for name and code attributes
  it 'is not valid if the name is not unique' do
    # Create a previos record of courses with the same name and then try to save
    # the new course built before
    FactoryBot.create(:course, name: course.name)

    expect(course).not_to be_valid
  end

  # validate uniqueness for name and code attributes
  it 'is not valid if the code is not unique' do
    # Create a previos record of courses with the same code and then try to save
    # the new course built before
    FactoryBot.create(:course, code: course.code)

    expect(course).not_to be_valid
  end

  # test associations

  # validate association with study programs
  it { should have_many(:study_program_courses) }
  it { should have_many(:study_programs).through(:study_program_courses) }

  it 'has_many Academic Records through acedemic_courses'

  it 'has_many Future Classes through future_courses'
  it 'has_many Attributes through attributes_courses'
  it 'Belongs to Bloc through bloc_courses'
  it 'has_many Groups'

end
