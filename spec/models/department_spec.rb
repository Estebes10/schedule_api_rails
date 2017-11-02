require 'rails_helper'

RSpec.describe Department, type: :model do

  subject(:department) do
    # Returns a department instance that's not saved
    FactoryGirl.build(:department)
  end

  # Test for all valid attributes are given
  it 'is valid if the name, description, campu_id, code and status are given ' do
    expect(department).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    department.name = nil

    expect(department).not_to be_valid
  end

  it 'is not valid without the campus_id' do
    department.campu_id = nil

    expect(department).not_to be_valid
  end

  it 'is not valid without a code' do
    department.code = nil

    expect(department).not_to be_valid
  end

  it 'is not valid without a status' do
    department.status = nil

    expect(department).not_to be_valid
  end

  # Set of tests to validate the length for each attribute
  it 'is not valid if the name given contains more than 128 characters' do
    department.name = 'a' * 129

    expect(department).not_to be_valid
  end

  it 'is not valid if the code given contains more than 32 characters' do
    department.code = 'a' * 33

    expect(department).not_to be_valid
  end

  it 'is not valid if the description given contains more than 512 characters' do
    department.description = 'a' * 513

    expect(department).not_to be_valid
  end

  # validate uniqueness for name and code attributes
  it 'is not valid if the name is not unique' do
    # Create a previos record of departments with the same name and then try to save
    # the new department built before
    FactoryGirl.create(:department, name: department.name)

    expect(department).not_to be_valid
  end

  it 'is not valid if the code is not unique' do
    # Create a previos record of departments with the same code and then try to save
    # the new department built before
    FactoryGirl.create(:department, code: department.code)

    expect(department).not_to be_valid
  end

  # test associations

  # Association with career
  it { should have_many(:careers) }

  # Association with campus
  it { should belong_to(:campu) }

end
