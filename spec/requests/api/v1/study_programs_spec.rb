# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Study Programs API', type: :request do

  # create a user to test
  let(:user) { create(:user) }

  # authorize request
  let(:headers) { valid_headers }

  # Test suite for POST /study_programs
  describe 'POST /api/v1/study_programs' do

    # valid payload
    let(:valid_attributes) do
      {
        study_program: {
          name:          'ISC11',
          description:   'Plan de estudio para el año 2011',
          total_courses: 64,
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
          .to match(/Validation failed: Status is not included in the list, Total courses can't be blank/)
      end

    end

  end

end
