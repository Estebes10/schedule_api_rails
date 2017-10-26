# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Courses API', type: :request do

  # create a user to test
  let(:user) { create(:user) }

  # authorize request
  let(:headers) { valid_headers }

  # Test suite for POST /courses
  describe 'POST /api/v1/courses' do

    # valid payload
    let(:valid_attributes) do
      {
        course: {
          name:        'Programación avanzada',
          code:        'TC1010F',
          description: 'Materia para programar de Pedro XD',
          units:       8,
          class_hours: 3,
          lab_hours:   0,
          status:      true,
        }
      }.to_json
    end

    context 'when the request is valid' do

      before { post '/api/v1/courses', params: valid_attributes, headers: headers }

      it "returns the course created" do
        course = Course.last

        expect(course.name).to eq('Programación avanzada')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end

    context 'when the request is invalid' do

      # Not all required attributes are given
      let(:invalid_attributes) do
        {
          course: {
            name:   'Programación avanzada',
            code:   'TC1010F',
            status: true,
          }
        }.to_json
      end

      before { post '/api/v1/courses', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Units can't be blank, Class hours can't be blank, Lab hours can't be blank/)
      end

    end

  end

end
