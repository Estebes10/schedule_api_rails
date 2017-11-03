require 'rails_helper'

RSpec.describe 'Departments API', type: :request do

  # In this class will be implemented all requests for department APIs with
  # differents methods: POST, GET, UPDATE and DELETE

  # create a user to test
  let(:user) { create(:user) }

  # create campus associated to the departments created
  let(:campus) { create(:campu) }

  # authorize request
  let(:headers) { valid_headers }

  # Initialize 10 records of department
  before(:each) do
    @total = 10
  end

  # create a list of 10 departments
  let!(:departments) { create_list(:department, @total, campu_id: campus.id) }

  # Test suite for GET /api/v1/departments
  describe 'GET /api/v1/departments' do

    context 'when departments exist' do

      # make HTTP get request before each example
      before { get '/api/v1/departments', params: {}, headers: headers}

      it 'returns departments' do
        expect(json).not_to be_empty
      end

      it 'return 10 records' do
        expect(json.size).to eq(@total)
      end

      it 'returns ok status' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when departments does not exist' do

      before(:each) do
        Department.destroy_all
      end

      # make HTTP get request before each example
      before { get '/api/v1/departments', params: {}, headers: headers}

      it 'not returns departments' do
        expect(json).to be_empty
      end

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(422)
      end

    end

  end

end
