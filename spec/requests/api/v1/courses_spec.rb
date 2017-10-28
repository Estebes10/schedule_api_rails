# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Courses API', type: :request do

  # create a user to test
  let(:user) { create(:user) }

  # authorize request
  let(:headers) { valid_headers }

  # Initialize 40 records of courses
  before(:each) do
    @total = 40
  end

  let!(:courses) { create_list(:course, @total) }

  # Test suite for GET /api/v1/courses
  describe 'GET /api/v1/courses' do

    context 'when courses exist' do

      # make HTTP get request before each example
      before { get '/api/v1/courses', params: {}, headers: headers}

      it 'returns courses' do
        expect(json).not_to be_empty
      end

      it 'return 40 records' do
        expect(json.size).to eq(@total)
      end

      it 'returns ok status' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when courses does not exist' do

      before(:each) do
        Course.destroy_all
      end

      # make HTTP get request before each example
      before { get '/api/v1/courses', params: {}, headers: headers}

      it 'not returns courses' do
        expect(json).to be_empty
      end

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(200)
      end

    end

  end

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
