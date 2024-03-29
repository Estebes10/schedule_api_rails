# This file implements a suit of tests for Career API endpoint requests
require 'rails_helper'

RSpec.describe 'careers API', type: :request do

  # create a user to test
  let(:user) { create(:user) }

  # create deparment
  let(:department) { create(:department) }

  # catch the ID of department to use in the URL
  let(:department_id) { department.id }

  # authorize request
  let(:headers) { valid_headers }

  # Initialize 10 records of career
  before(:each) do
    @total = 10
  end

  # create a list of 10 careers
  let!(:careers) { create_list(:career, @total, department_id: department_id) }

  # use the first record of the list created previously
  let!(:career_id) { careers.first.id }

  # Test suite for GET /api/v1/departments/:department_id/careers
  describe 'GET /api/v1/departments/:department_id/careers' do

    context 'when careers exist' do

      # make HTTP get request before each example
      before(:each) do
        get(
          "/api/v1/departments/#{department_id}/careers",
          params: {},
          headers: headers
        )
      end

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
      before(:each) do
        get(
          "/api/v1/departments/#{department_id}/careers",
          params: {},
          headers: headers
        )
      end

      it 'not returns careers' do
        expect(json).to be_empty
      end

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(422)
      end

    end

  end

  # Test suite for GET api/v1/departments/:department_id/careers/:id
  describe 'GET /api/v1/departments/:department_id/careers/:id' do

    # Make request to the URL to get one career
    before(:each) do
      get(
        "/api/v1/departments/#{department_id}/careers/#{career_id}",
        params: {},
        headers: headers
      )
    end

    context 'when record exists' do

      it 'returns the career' do
        expect(json).not_to be_empty
      end

      it 'returns an ok status code' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when the record does not exists' do

      after(:each) do
        department.careers.destroy_all
      end

      # use an ID that not exists
      let(:career_id) { 0 }

      it 'returns not found status code' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Career")
      end

    end

  end

  # Test suite for POST /api/v1/departments/:department_id/careers
  describe 'POST /api/v1/departments/:department_id/careers' do

    # valid payload
    let(:valid_attributes) do
      {
        name:        'Ingeniería en Sistemas Computacionales',
        code:        'ISC',
        description: 'Esta es una carrera impartida en el campus querétaro',
        status:      true,
      }.to_json
    end

    context 'when the request is valid' do

      # make request to /api/v1/courses
      before(:each) do
        post(
          "/api/v1/departments/#{department_id}/careers",
          params: valid_attributes,
          headers: headers
        )
      end

      it 'adds a new record' do
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

      # try to request to /api/v1/careers
      before(:each) do
        post(
          "/api/v1/departments/#{department_id}/careers",
          params: invalid_attributes,
          headers: headers
        )
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Code can't be blank/)
      end

    end

  end

  # Test suite for PUT /api/v1/departments/:department_id/careers/:id
  describe 'PUT /api/v1/departments/:department_id/careers/:id' do

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

      before(:each) do
        put(
          "/api/v1/departments/#{department_id}/careers/#{career_id}",
          params: valid_attributes,
          headers: headers
        )
      end

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
      before(:each) do
        put(
          "/api/v1/departments/#{department_id}/careers/#{career_id}",
          params: { name: nil }.to_json,
          headers: headers
        )
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      # test that the attributes are not changed
      it 'not contains the new name' do
        expect(@career.name)
          .not_to eq('Licenciatura en Negocios Internacionales')
      end

      it 'not contains the new description' do
        expect(@career.description).not_to eq('No matemáticas')
      end

    end

    context 'when the record does not exist' do

      # Use an ID not valid
      let(:career_id) { 0 }

      before(:each) do
        put(
          "/api/v1/departments/#{department_id}/careers/#{career_id}",
          params: valid_attributes,
          headers: headers
        )
      end

      it 'not updates the record' do
        expect(@career.code).not_to eq('LIN')
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Career")
      end

    end

    context 'when invalid headers' do

      # Use no valid headers
      let(:no_token) { invalid_headers }

      before(:each) do
        put(
          "/api/v1/departments/#{department_id}/careers/#{career_id}",
          params: valid_attributes,
          headers: no_token
        )
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(422)
      end

    end

  end

  # Test suite for DELETE /api/v1/departments/:department_id/careers/:id
  describe 'DELETE /api/v1/departments/:department_id/careers/:id' do

    context 'when record exists' do

      # before each test make a request to the endpoint
      before(:each) do
        delete(
          "/api/v1/departments/#{department_id}/careers/#{career_id}",
          params: {},
          headers: headers
        )
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'reduce the records of the careers table' do
        expect(Career.count).to eq(@total - 1)
      end

    end

    context 'when record not found' do

      # Use an ID not valid
      let(:career_id_false) { 0 }

      # before each test make a request to the endpoint
      before(:each) do
        delete(
          "/api/v1/departments/#{department_id}/careers/#{career_id_false}",
          params: {},
          headers: headers
        )
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

    end

  end

end
