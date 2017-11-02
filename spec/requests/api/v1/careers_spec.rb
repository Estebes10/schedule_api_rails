require 'rails_helper'

RSpec.describe 'careers API', type: :request do

  # create a user to test
  let(:user) { create(:user) }

  # create deparment
  let(:department) { create(:department) }

  # authorize request
  let(:headers) { valid_headers }

  # Initialize 10 records of career
  before(:each) do
    @total = 10
  end

  # create a list of 10 careers
  let!(:careers) { create_list(:career, @total, department_id: department.id) }

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
        expect(response).to have_http_status(422)
      end

    end

  end

  # Test suite for POST /careers
  describe 'POST /api/v1/careers' do

    # valid payload
    let(:valid_attributes) do
      {
        name:        'Ingeniería en Sistemas Computacionales',
        code:        'ISC',
        description: 'Esta es una carrera impartida en el campus querétaro',
        status:      true,
        department_id: department.id,
      }.to_json
    end

    context 'when the request is valid' do

      before { post '/api/v1/careers', params: valid_attributes, headers: headers }

      it "adds a new record" do
        expect(Career.count).to eq(@total + 1)
      end

      it 'returns the career created' do
        career = Career.last

        expect(career.name).to eq('Ingeniería en Sistemas Computacionales')
      end

      it 'contains the code' do
        career = Career.last

        expect(career.code).to eq('ISC')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end

    context 'when the request is invalid' do

      # Not all required attributes are given
      let(:invalid_attributes) do
        {
          name:   Faker::Educator.course,
          status: true,
        }.to_json
      end

      before { post '/api/v1/careers', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Department must exist, Code can't be blank/)
      end

    end

  end

end
