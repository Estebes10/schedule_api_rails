require 'rails_helper'

RSpec.describe 'careers API', type: :request do

  # create a user to test
  let(:user) { create(:user) }

  # authorize request
  let(:headers) { valid_headers }

  # Initialize 10 records of career
  before(:each) do
    @total = 10
  end

  # create a list of 10 careers
  let!(:careers) { create_list(:career, @total) }

  # Test suite for GET /api/v1/careers
  describe 'GET /api/v1/careers' do

    context 'when careers exist' do

      # make HTTP get request before each example
      before { get '/api/v1/careers', params: {}, headers: headers}

      it 'returns careers' do
        expect(json).not_to be_empty
      end

      it 'return 10 records' do
        expect(json.size).to eq(@total)
      end

      it 'returns ok status' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when careers does not exist' do

      before(:each) do
        Career.destroy_all
      end

      # make HTTP get request before each example
      before { get '/api/v1/careers', params: {}, headers: headers}

      it 'not returns careers' do
        expect(json).to be_empty
      end

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(200)
      end

    end

  end

end
