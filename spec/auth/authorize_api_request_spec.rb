# This file implements a suit of test to autorize request for users with valid
# authentication.
require 'rails_helper'

RSpec.describe AuthorizeApiRequest do

  # Create test user
  let(:user) { create(:user) }

  # Mock `Authorization` header
  let(:header) do
    {
      'Authorization' => token_generator(user.id),
    }
  end

  # Invalid request subject
  subject(:invalid_request_obj) { described_class.new({}) }

  # Valid request subject
  subject(:request_obj) { described_class.new(header) }

  # Test Suite for AuthorizeApiRequest#call
  # This is our entry point into the service class
  describe '#call' do

    # returns user object when request is valid
    context 'when valid request' do

      it 'returns user object' do
        result = request_obj.call
        expect(result[:user]).to eq(user)
      end

    end

    # returns error message when invalid request
    context 'when invalid request' do

      context 'when missing token' do

        it 'raises a MissingToken error' do
          expect { invalid_request_obj.call }
            .to raise_error(ExceptionHandler::MissingToken, 'Missing token')
        end

      end

      context 'when invalid token' do

        subject(:invalid_request_obj) do
          # Generate valid token to not user created
          described_class.new('Authorization' => token_generator(5))
        end

        it 'raises an InvalidToken error' do
          expect { invalid_request_obj.call }
            .to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
        end

      end

      context 'when token is expired' do

        # Generate a expired token
        let(:header) { { 'Authorization' => expired_token_generator(user.id) } }
        subject(:request_obj) { described_class.new(header) }

        it 'raises ExceptionHandler::ExpiredSignature error' do
          expect { request_obj.call }
            .to raise_error(ExceptionHandler::ExpiredSignature, /Sorry, your token has expired. Please login to continue./)
        end

      end

    end

  end

end
