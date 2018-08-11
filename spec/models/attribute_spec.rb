require 'rails_helper'

RSpec.describe Attribute, type: :model do

  subject(:attribute) do
    # Returns a campus instance that's not saved
    FactoryBot.build(:attribute)
  end

  # Test for all valid attributes are given
  it 'is valid if the type name, code, description and status are given ' do
    expect(attribute).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    attribute.name = nil

    expect(attribute).not_to be_valid
  end

  it 'is not valid without a status' do
    attribute.status = nil

    expect(attribute).not_to be_valid
  end

  it 'is not valid without a code' do
    attribute.code = nil

    expect(attribute).not_to be_valid
  end

  # Test for optional attribute
  it 'is valid without a description' do
    attribute.description = nil

    expect(attribute).to be_valid
  end

  # Set of tests to validate the length for each attribute
  it 'is not valid if the name given contains more than 64 characters' do
    attribute.name = 'a' * 65

    expect(attribute).not_to be_valid
  end

  it 'is not valid if the description given contains more than 1024' \
     'characters' do
    attribute.description = 'a' * 1025

    expect(attribute).not_to be_valid
  end

  it 'is not valid if the code given contains more than 8 characters' do
    attribute.code = 'a' * 9

    expect(attribute).not_to be_valid
  end

  # validate uniqueness for code and name attributes
  it 'is not valid if the code is not unique' do
    # Create a previos record of attribute and then try to save the new
    # attribute built before
    FactoryBot.create(:attribute, code: attribute.code)

    expect(attribute).not_to be_valid
  end

  it 'is not valid if the name is not unique' do
    FactoryBot.create(:attribute, name: attribute.name)

    expect(attribute).not_to be_valid
  end

end
