# This file implements a suit of tests to check associations, validations and
# methods in Campus Model.
require 'rails_helper'

RSpec.describe Campu, type: :model do

  subject(:campus) do
    # Returns a campus instance that's not saved
    FactoryBot.build(:campu)
  end

  # Test for all valid attributes are given
  it 'is valid if the name, code, description, state and status are given ' do
    expect(campus).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    campus.name = nil

    expect(campus).not_to be_valid
  end

  it 'is not valid without a code' do
    campus.code = nil

    expect(campus).not_to be_valid
  end

  it 'is not valid without a state' do
    campus.state = nil

    expect(campus).not_to be_valid
  end

  it 'is not valid without a status' do
    campus.status = nil

    expect(campus).not_to be_valid
  end

  # Set of tests to validate the length for each attribute
  it 'is not valid if the name given contains more than 128 characters' do
    campus.name = 'a' * 129

    expect(campus).not_to be_valid
  end

  it 'is not valid if the code given contains more than 32 characters' do
    campus.code = 'a' * 33

    expect(campus).not_to be_valid
  end

  it 'is not valid if description given contains more than 512 characters' do
    campus.description = 'a' * 513

    expect(campus).not_to be_valid
  end

  it 'is not valid if the state given contains more than 64 characters' do
    campus.state = 'a' * 65

    expect(campus).not_to be_valid
  end

  # validate uniqueness for name and code attributes
  it 'is not valid if the name is not unique' do
    # Create a previos record of campuss with the same name and then try to save
    # the new campus built before
    FactoryBot.create(:campu, name: campus.name)

    expect(campus).not_to be_valid
  end

  # validate uniqueness for name and code attributes
  it 'is not valid if the code is not unique' do
    # Create a previos record of campuss with the same code and then try to save
    # the new campus built before
    FactoryBot.create(:campu, code: campus.code)

    expect(campus).not_to be_valid
  end

  # test associations

  # validate association with study programs
  it { should have_many(:departments) }

end
