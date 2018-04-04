# This file implements a suit of tests to check associations, validations and
# methods in StudyProgram Model.
require 'rails_helper'

RSpec.describe StudyProgram, type: :model do

  subject(:study_program) do
    # Returns a StudyProgram instance that's not saved
    FactoryGirl.build(:study_program)
  end

  # Test for all valid attributes are given
  it 'is valid if the name, description, status and total_courses are given' do
    expect(study_program).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    study_program.name = nil

    expect(study_program).not_to be_valid
  end

  it 'is not valid without a status' do
    study_program.status = nil

    expect(study_program).not_to be_valid
  end

  # Set of tests to validate the length for each attribute
  it 'is not valid if the name given contains more than 128 characters' do
    study_program.name = 'a' * 129

    expect(study_program).not_to be_valid
  end

  it 'is not valid if description given contains more than 512 characters' do
    study_program.description = 'a' * 513

    expect(study_program).not_to be_valid
  end

  # validate uniqueness for name attribute
  it 'is not valid if the name is not unique' do
    # Create a previos record of study_program and then try to save the new
    # study_program with the same name
    FactoryGirl.create(:study_program, name: study_program.name)

    expect(study_program).not_to be_valid
  end

  # Test associations

  # validate association with semester
  it { should have_many(:semesters) }

  it 'has many students'

  it 'belongs to career' do
    assc = described_class.reflect_on_association(:career)
    expect(assc.macro).to eq(:belongs_to)
  end

end
