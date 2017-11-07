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

  # use the first record of the list created previously
  let!(:career_id) { careers.first.id }

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

  # Test suite for GET api/v1/careers/:id
  describe 'GET /api/v1/careers/:id' do

    # Make request to the URL to get one career
    before { get "/api/v1/careers/#{career_id}", params: {}, headers: headers }

    context 'when record exists' do

      it 'returns the career' do
        expect(json).not_to be_empty
      end

      it 'returns an ok status code' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when the record does not exists' do

      # use an ID that not exists
      let(:career_id) { 1000 }

      it 'returns not found status code' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Career with 'id'=#{career_id}/)
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

  # Test suite for PUT /api/v1/careers/:id
  describe 'PUT /api/v1/careers/:id' do

    # Set of valid attributes to change one record of careers
    let(:valid_attributes) do
      {
        name:        'Licenciatura en Negocios Internacionales',
        code:        'LIN',
        description: 'No matemáticas',
        status:      true,
      }.to_json
    end

    before(:each) do
      @career = careers.first
    end

    context 'when the record exists' do

      before { put "/api/v1/careers/#{career_id}", params: valid_attributes, headers: headers }

      # Test if the attributes are changed
      it 'contains the new name' do
        @career.reload
        expect(@career.name).to eq('Licenciatura en Negocios Internacionales')
      end

      it 'contains the new code' do
        @career.reload
        expect(@career.code).to eq('LIN')
      end

      it 'contains the new description' do
        @career.reload
        expect(@career.description).to eq('No matemáticas')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(:ok)
      end

    end

    context 'when attributes are not valid' do

      # testing sent an empty name
      before {
        put "/api/v1/careers/#{career_id}",
        params: {
          name: nil
        }.to_json,
        headers: headers
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      # test that the attributes are not changed
      it 'not contains the new name' do
        expect(@career.name).not_to eq('Licenciatura en Negocios Internacionales')
      end

      it 'not contains the new description' do
        expect(@career.description).not_to eq('No matemáticas')
      end

    end

    context 'when the record does not exist' do

      # Use an ID not valid
      let(:career_id_false) { 100 }

      before {
        put "/api/v1/careers/#{career_id_false}",
        params: valid_attributes,
        headers: headers
      }

      it 'not updates the record' do
        expect(@career.code).not_to eq('LIN')
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Career with 'id'=#{career_id_false}/)
      end

    end

    context 'when invalid headers' do

      # Use no valid headers
      let(:no_token) { invalid_headers }

      before {
        put "/api/v1/careers/#{career_id}",
        params: valid_attributes,
        headers: no_token
      }

      it 'returns status code 404' do
        expect(response).to have_http_status(422)
      end

    end

  end

end
