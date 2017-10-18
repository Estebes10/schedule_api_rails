require 'rails_helper'

RSpec.describe Role, type: :model do

  subject(:role) do
    # Returns a User instance that's not saved
    FactoryGirl.build(:role)
  end

  # Test for all valid attributes are given
  it 'is valid if the name, description and status are given' do
    expect(role).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    role.name = nil

    expect(role).not_to be_valid
  end

  it 'is not valid without a description' do
    role.description = nil

    expect(role).not_to be_valid
  end

  it 'is not valid without a status' do
    role.status = nil

    expect(role).not_to be_valid
  end

  # Set of tests to validate the length for each attribute
  it 'is not valid if the name given contains more than 32 characters' do
    role.name = 'a' * 33

    expect(role).not_to be_valid
  end

  it 'is not valid if the description given contains more than 64 characters' do
    role.description = 'a' * 65

    expect(role).not_to be_valid
  end

  # validate uniqueness for name attribute
  it 'is not valid if the name is not unique' do
    # Create a previos record of roles and then try to save the new role built
    # before
    FactoryGirl.create(:role, name: role.name)

    expect(role).not_to be_valid
  end

end
