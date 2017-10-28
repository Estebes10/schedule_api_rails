# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Study Programs API', type: :request do

  # create a user to test
  let(:user) { create(:user) }

  # Initialize 10 records of study programs
  before(:each) do
    @total = 10
  end

  let!(:study_programs) { create_list(:study_program, @total) }

  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /api/v1/study_programs
  describe 'GET /api/v1/study_programs' do

    context 'when study programs exist' do

      # make HTTP get request before each example
      before { get '/api/v1/study_programs', params: {}, headers: headers}

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
      before { get '/api/v1/study_programs', params: {}, headers: headers}

      it 'not returns study programs' do
        expect(json).to be_empty
      end

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(200)
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
        }
      }.to_json
    end

    context 'when the request is valid' do

      before { post '/api/v1/study_programs', params: valid_attributes, headers: headers }

      it "returns the course created" do
        course = StudyProgram.last

        expect(course.name).to eq('ISC11')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end

    context 'when the request is invalid' do

      # Only one required attribute is given
      before { post '/api/v1/study_programs', params: { name: 'ISC18' }.to_json, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Status is not included in the list/)
      end

    end

  end

end
