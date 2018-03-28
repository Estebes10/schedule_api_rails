# This file implements a suit of tests to check associations, validations and
# methods in User Model.
require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    # Returns a User instance that's not saved
    FactoryGirl.build(:user)
  end

  # Test for all valid attributes are given
  it 'is valid if the name, last_name, password, email, phone_number, gender' \
     'id_college and status are given' do
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

  it 'is not valid without a id_college' do
    user.id_college = nil

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
  it 'is not valid if the name given contains more than 128 characters' do
    user.name = 'a' * 129

    expect(user).not_to be_valid
  end

  it 'is not valid if the last_name given contains more than 128 characters' do
    user.last_name = 'a' * 129

    expect(user).not_to be_valid
  end

  it 'is not valid if the id_college given contains more than 16 characters' do
    user.id_college = 'a' * 17

    expect(user).not_to be_valid
  end

  it 'is not valid if the password given contains more than 32 characters' do
    # to this test we use password because we are testing the length of the
    # string on params before to be encrypted to a hash for password_digest
    user.password = 'a' * 33

    expect(user).not_to be_valid
  end

  it 'is not valid if the email given contains more than 64 characters' do
    user.email = 'a' * 65

    expect(user).not_to be_valid
  end

  it 'is not valid if phone number given contains more than 32 characters' do
    user.phone = 'a' * 33

    expect(user).not_to be_valid
  end

  it 'is not valid if the gender given contains more than 16 characters' do
    user.gender = 'a' * 17

    expect(user).not_to be_valid
  end

  # validate uniqueness for email attribute
  it 'is not valid if the email is not unique' do
    # Create a previos record of users and then try to save the new user built
    # before
    FactoryGirl.create(:user, email: user.email)

    expect(user).not_to be_valid
  end

  # test association with roles
  it { should have_many(:assignments) }
  it { should have_many(:roles).through(:assignments) }

  # validate role for users
  describe '.role?' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @role = FactoryGirl.create(:role)
    end

    it 'verify if the user has one role' do
      expect(@user.role?).to eq(false)
    end

    it 'validates if the role is saved' do
      Assignment.create(user: @user, role: @role)

      expect(@user.role?).to eq(true)
    end

  end

  # validate role name for users
  describe '.role_name?' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @role = FactoryGirl.create(:role)
    end

    after(:all) do
      User.destroy_all
    end

    it 'not return the name' do
      expect(@user.role_name?).to eq(nil)
    end

    it 'returns the role name' do
      Assignment.create(user: @user, role: @role)

      expect(@user.role_name?).to eq(@role.name)
    end

  end

end
