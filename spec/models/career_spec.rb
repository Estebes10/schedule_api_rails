require 'rails_helper'

RSpec.describe Career, type: :model do

  subject(:career) do
    # Returns a career instance that's not saved
    FactoryGirl.build(:career)
  end

  # Test for all valid attributes are given
  it 'is valid if the name, description, code and status are given ' do
    expect(career).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    career.name = nil

    expect(career).not_to be_valid
  end

  it 'is not valid without a code' do
    career.code = nil

    expect(career).not_to be_valid
  end

  it 'is not valid without a status' do
    career.status = nil

    expect(career).not_to be_valid
  end

  # Set of tests to validate the length for each attribute
  it 'is not valid if the name given contains more than 128 characters' do
    career.name = 'a' * 129

    expect(career).not_to be_valid
  end

  it 'is not valid if the code given contains more than 32 characters' do
    career.code = 'a' * 33

    expect(career).not_to be_valid
  end

  it 'is not valid if the description given contains more than 512 characters' do
    career.description = 'a' * 513

    expect(career).not_to be_valid
  end

  # validate uniqueness for name and code attributes
  it 'is not valid if the name is not unique' do
    # Create a previos record of careers with the same name and then try to save
    # the new career built before
    FactoryGirl.create(:career, name: career.name)

    expect(career).not_to be_valid
  end

  # validate uniqueness for name and code attributes
  it 'is not valid if the code is not unique' do
    # Create a previos record of careers with the same code and then try to save
    # the new career built before
    FactoryGirl.create(:career, code: career.code)

    expect(career).not_to be_valid
  end

  # test associations

  # validate association with study programs
  it { should have_many(:study_programs) }

  # association with deparment
  it { should belong_to(:department) }

  it 'has_many Students'
  it 'has_one Career Director'

end
