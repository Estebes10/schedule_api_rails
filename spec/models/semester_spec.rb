require 'rails_helper'

RSpec.describe Semester, type: :model do

  subject(:semester) do
    # Returns a Semester instance that's not saved
    FactoryGirl.build(:semester)
  end

  # Test for all valid attributes are given
  it 'is valid if the semeter_number, status and study_program_id are given' do
    expect(semester).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a semester_number' do
    semester.semester_number = nil

    expect(semester).not_to be_valid
  end

  it 'is not valid without a status' do
    semester.status = nil

    expect(semester).not_to be_valid
  end

  it 'is not valid without a study_program_id' do
    semester.study_program_id = nil

    expect(semester).not_to be_valid
  end

  # validate uniqueness for semeter_number attribute
  it 'is not valid if the semester_number is not unique' do
    # Create a previos record of semester and then try to save the new semester
    # built before
    FactoryGirl.create(:semester, semester_number: semester.semester_number)

    expect(semester).not_to be_valid
  end

  # test association with study_program
  it { should belong_to(:study_program) }

  # validate association with courses
  it { should have_many(:semester_courses) }
  it { should have_many(:courses).through(:semester_courses) }

  it 'has many student_semesters'
  it 'has many future_classes'
end
