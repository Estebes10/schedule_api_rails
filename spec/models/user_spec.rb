require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    # Returns a User instance that's not saved
    FactoryGirl.build(:user)
  end

  # Test for all valid attributes are given
  it 'is valid if the name, last_name, password, email, phone_number, gender' \
     ' and status are given' do
    expect(user).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    user.name = nil

    expect(user).not_to be_valid
  end

  it 'is not valid without a last_name' do
    user.last_name = nil

    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user.password_digest = nil

    expect(user).not_to be_valid
  end

  it 'is not valid without an email' do
    user.email = nil

    expect(user).not_to be_valid
  end

  it 'is not valid without a phone number' do
    user.phone = nil

    expect(user).not_to be_valid
  end

  it 'is not valid without a gender' do
    user.gender = nil

    expect(user).not_to be_valid
  end

  it 'is not valid without a birthday' do
    user.birthday = nil

    expect(user).not_to be_valid
  end

  it 'is not valid without a status' do
    user.status = nil

    expect(user).not_to be_valid
  end

  # Set of tests to validate the length for each attribute
  it 'is not valid if the name given contains more than 64 characters' do
    user.name = 'a' * 65

    expect(user).not_to be_valid
  end

  it 'is not valid if the last_name given contains more than 64 characters' do
    user.last_name = 'a' * 65

    expect(user).not_to be_valid
  end

  it 'is not valid if the password given contains more than 32 characters' do
    user.password_digest = 'a' * 33

    expect(user).not_to be_valid
  end

  it 'is not valid if the email given contains more than 64 characters' do
    user.email = 'a' * 65

    expect(user).not_to be_valid
  end

  it 'is not valid if the phone number given contains more than 64 characters' do
    user.phone = 'a' * 65

    expect(user).not_to be_valid
  end

  it 'is not valid if the gender given contains more than 16 characters' do
    user.gender = 'a' * 17

    expect(user).not_to be_valid
  end

end
