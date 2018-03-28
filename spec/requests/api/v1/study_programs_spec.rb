# This file implements a suit of tests for Study Programs API endpoint requests
require 'rails_helper'

RSpec.describe 'Study Programs API', type: :request do

  # create a user to test
  let(:user) { create(:user) }

  let!(:career) { create(:career) }

  # Initialize 10 records of study programs
  before(:each) do
    @total = 10
  end

  # Create a list of study programs
  let!(:study_programs) do
    create_list(
      :study_program,
      @total,
      career_id: career.id
    )
  end

  # Use the first element of StudyProgram
  let(:study_id) { study_programs.first.id }

  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /api/v1/study_programs
  describe 'GET /api/v1/study_programs' do

    context 'when study programs exist' do

      # make HTTP get request before each example
      before { get '/api/v1/study_programs', params: {}, headers: headers }

      it 'returns study programs' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
      end

      it 'return 10 records' do
        expect(json.size).to eq(@total)
      end

      it 'returns ok status' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when study programs does not exists' do

      before(:each) do
        StudyProgram.destroy_all
      end

      # make HTTP get request before each example
      before { get '/api/v1/study_programs', params: {}, headers: headers }

      it 'not returns study programs' do
        expect(json).to be_empty
      end

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(200)
      end

    end

  end

  # Test suite for GET /study_programs/:id
  describe 'GET /api/v1/study_programs/:id' do

    # Make request to the URL to get study program
    before(:each) do
      get "/api/v1/study_programs/#{study_id}", params: {}, headers: headers
    end

    context 'when the record exists' do

      it 'returns the study program' do
        expect(json).not_to be_empty
      end

      it 'returns ok status code' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when the record does not exist' do

      # user an id that not exits
      let(:study_id) { 1000 }

      it 'returns not found status code' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body)
          .to match(/Couldn't find StudyProgram with 'id'=#{study_id}/)
      end

    end

  end

  # Test suite for POST /study_programs
  describe 'POST /api/v1/study_programs' do

    # valid payload
    let(:valid_attributes) do
      {
        study_program: {
          name:          'ISC11',
          description:   'Plan de estudio para el año 2011',
          status:        true,
          career_id:     career.id,
        },
      }.to_json
    end

    context 'when the request is valid' do

      before(:each) do
        post(
          '/api/v1/study_programs',
          params: valid_attributes,
          headers: headers
        )
      end

      it 'returns the study program created' do
        study = StudyProgram.last

        expect(study.name).to eq('ISC11')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end

    context 'when the request is invalid' do

      # Only one required attribute is given
      before(:each) do
        post(
          '/api/v1/study_programs',
          params: { name: 'ISC18' }.to_json,
          headers: headers
        )
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Career must exist, Status is not included in the list/)
      end

    end

  end

  # Test suite for PUT /study_programs/:id
  describe 'PUT /api/v1/study_programs/:id' do

    let(:valid_attributes) do
      {
        study_program: {
          name:          'ISDR20',
          description:   'Plan de estudio para el año 2020',
          status:        true,
        },
      }.to_json
    end

    before(:each) do
      @study = study_programs.first
    end

    context 'when the record exists' do

      before(:each) do
        put(
          "/api/v1/study_programs/#{study_id}",
          params: valid_attributes,
          headers: headers
        )
      end

      it 'contains the new name' do
        @study.reload
        expect(@study.name).to eq('ISDR20')
      end

      it 'contains the new description' do
        @study.reload
        expect(@study.description).to eq('Plan de estudio para el año 2020')
      end

      it 'contains the new status' do
        @study.reload
        expect(@study.status).to eq(true)
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(:ok)
      end

    end

    context 'when attributes are not valid' do

      before(:each) do
        put(
          "/api/v1/study_programs/#{study_id}",
          params: { name: nil }.to_json,
          headers: headers
        )
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'not contains the new name' do
        expect(@study.name).not_to eq('ISDR20')
      end

      it 'not contains the new description' do
        expect(@study.description).not_to eq('Plan de estudio para el año 2020')
      end

    end

    context 'when the record does not exist' do

      # Use an ID not valid
      let(:study_id_false) { 100 }

      before(:each) do
        put(
          "/api/v1/study_programs/#{study_id_false}",
          params: valid_attributes,
          headers: headers
        )
      end

      it 'not updates the record' do
        expect(@study.name).not_to eq('ISDR20')
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body)
          .to match(/Couldn't find StudyProgram with 'id'=#{study_id_false}/)
      end

    end

  end

  # Test suite for DELETE /study_programs/:id
  describe 'DELETE /api/v1/study_programs/:id' do

    context 'when record found' do

      before(:each) do
        delete(
          "/api/v1/study_programs/#{study_id}",
          params: {},
          headers: headers
        )
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'reduce the records of the study_programs table' do
        expect(StudyProgram.count).to eq(@total - 1)
      end

    end

    context 'when record not found' do

      # Use an ID not valid
      let(:study_id_false) { 1000 }

      before(:each) do
        delete(
          "/api/v1/study_programs/#{study_id_false}",
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
