# This file implements a suit of tests for Course API endpoint requests
require 'rails_helper'

RSpec.describe 'Courses API', type: :request do

  # create a user to test
  let(:user) { create(:user) }

  # authorize request
  let(:headers) { valid_headers }

  # create deparment
  let(:department) { create(:department) }

  # catch the ID of department to use in the URL
  let(:department_id) { department.id }

  # create deparment
  let!(:career) { create(:career, department_id: department_id) }

  # catch the ID of department to use in the URL
  let(:career_id) { career.id }

  # create deparment
  let!(:study_program) { create(:study_program, career_id: career_id) }

  # catch the ID of department to use in the URL
  let(:study_program_id) { study_program.id }

  # Create course and attribute to assign in courses association
  let(:course_aux) { create(:course) }

  let(:attribute_aux) { create(:attribute) }

  # Initialize 40 records of courses
  before(:each) do
    @total = 40
  end

  # create a list of 40 courses
  let!(:courses) { create_list(:course, @total) }

  # Use the first course of the list created
  let!(:course_id) { courses.first.id }

  # Test suite for GET
  # /api/v1/courses
  describe 'GET /api/v1/courses' do

    context 'when courses exist' do

      # make HTTP get request before each example
      before(:each) do
        get(
          "/api/v1/courses",
          params: {},
          headers: headers
        )
      end

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
      before(:each) do
        get(
          "/api/v1/courses",
          params: {},
          headers: headers
        )
      end

      it 'not returns courses' do
        expect(json).to be_empty
      end

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(200)
      end

    end

  end

  # Test suite for GET
  # /api/v1/courses/:id
  describe 'GET /api/v1/courses/:id' do

    # Make request to the URL to get one course
    before(:each) do
      get(
        "/api/v1/courses/#{course_id}",
        params: {},
        headers: headers
      )
    end

    context 'when record exists' do

      it 'returns the course' do
        expect(json).not_to be_empty
      end

      it 'returns an ok status code' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when the record does not exists' do

      # use an ID that not exists
      let(:course_id) { 1000 }

      it 'returns not found status code' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body)
          .to match(/Couldn't find Course with 'id'=#{course_id}/)
      end

    end

  end

  # Test suite for POST
  # /api/v1/courses
  describe 'POST /api/v1/courses' do

    # valid payload
    let(:valid_attributes) do
      {
        name:        'Programación avanzada',
        code:        'TC1010F',
        description: 'Materia para programar de Pedro XD',
        units:       8,
        class_hours: 3,
        lab_hours:   0,
        status:      true,
        courses:     [{ course_id: course_aux.id, attribute_id: attribute_aux.id }],
      }.to_json
    end

    context 'when the request is valid' do

      before(:each) do
        post(
          "/api/v1/courses",
          params: valid_attributes,
          headers: headers
        )
      end

      it 'creates the course with the given name' do
        course = Course.last

        expect(course.name).to eq(JSON.parse(valid_attributes)['name'])
      end

      it 'creates the course with the given code' do
        course = Course.last

        expect(course.code).to eq(JSON.parse(valid_attributes)['code'])
      end

      it 'creates the course with the given description' do
        course = Course.last

        expect(course.description)
          .to eq(JSON.parse(valid_attributes)['description'])
      end

      it 'creates the course with the given units' do
        course = Course.last

        expect(course.units).to eq(JSON.parse(valid_attributes)['units'])
      end

      it 'creates the course with the given lab hours class' do
        course = Course.last

        expect(course.lab_hours).to eq(JSON.parse(valid_attributes)['lab_hours'])
      end

      it 'creates the course with the given class hours' do
        course = Course.last

        expect(course.class_hours)
          .to eq(JSON.parse(valid_attributes)['class_hours'])
      end

      it 'creates the course with the given status' do
        course = Course.last

        expect(course.status).to eq(JSON.parse(valid_attributes)['status'])
      end

      it 'creates the course with the given courses associations' do
        course = Course.last

        expect(course).to eq(valid_attributes)
      end

      it 'returns a successfully message' do
        expect(json['message']).to match(/Great, the Course was created successfully/)
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
          code:   'TC1010F',
          status: true,
        }.to_json
      end

      before(:each) do
        post(
          "/api/v1/courses",
          params: invalid_attributes,
          headers: headers
        )
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Units can't be blank, Class hours can't be blank, Lab hours can't be blank/)
      end

    end

  end

  # Test suite for PUT
  # /api/v1/courses/:id
  describe 'PUT /api/v1/courses/:id' do

    # Set of valid attributes to change one record of courses
    let(:valid_attributes) do
      {
        name:        'Microcontroladores',
        code:        'TC10482D',
        description: 'In this course will show new things',
        units:       15,
        class_hours: 5,
        lab_hours:   1,
        status:      true,
      }.to_json
    end

    before(:each) do
      @course = courses.first
    end

    context 'when the record exists' do

      before(:each) do
        put(
          "/api/v1/courses/#{course_id}",
          params: valid_attributes,
          headers: headers
        )
      end

      # Test if the attributes are changed
      it 'contains the new name' do
        @course.reload
        expect(@course.name).to eq(JSON.parse(valid_attributes)['name'])
      end

      it 'contains the new code' do
        @course.reload
        expect(@course.code).to eq(JSON.parse(valid_attributes)['code'])
      end

      it 'contains the new description' do
        @course.reload
        expect(@course.description)
          .to eq(JSON.parse(valid_attributes)['description'])
      end

      it 'contains the new units value' do
        @course.reload
        expect(@course.units).to eq(JSON.parse(valid_attributes)['units'])
      end

      it 'contains the new units of class hours' do
        @course.reload
        expect(@course.class_hours)
          .to eq(JSON.parse(valid_attributes)['class_hours'])
      end

      it 'contains the new units of laboratory hours class' do
        @course.reload
        expect(@course.lab_hours)
          .to eq(JSON.parse(valid_attributes)['lab_hours'])
      end

      it 'contains the new status' do
        @course.reload
        expect(@course.status).to eq(JSON.parse(valid_attributes)['status'])
      end

      it 'returns a successfully message' do
        expect(json['message']).to match(/The Course was updated successfully/)
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(:ok)
      end

    end

    context 'when attributes are not valid' do

      # testing sent an empty name
      before(:each) do
        put(
          "/api/v1/courses/#{course_id}",
          params: { name: nil }.to_json,
          headers: headers
        )
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      # test that the attributes are not changed
      it 'not contains the new name' do
        expect(@course.name).not_to eq('Microcontroladores')
      end

      it 'not contains the new description' do
        expect(@course.description).not_to eq('In this course will show new things')
      end

    end

    context 'when the record does not exist' do

      # Use an ID not valid
      let(:course_id_false) { 100 }

      before(:each) do
        put(
          "/api/v1/courses/#{course_id_false}",
          params: valid_attributes,
          headers: headers
        )
      end

      it 'not updates the record' do
        expect(@course.name).not_to eq('ISDR20')
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body)
          .to match(/Couldn't find Course with 'id'=#{course_id_false}/)
      end

    end

  end

  # Test suite for DELETE
  # /api/v1/courses/:id
  describe 'DELETE /api/v1/courses/:id' do

    context 'when record exists' do

      before(:each) do
        delete(
          "/api/v1/courses/#{course_id}",
          params: {},
          headers: headers
        )
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'reduce the records of the courses table' do
        expect(Course.count).to eq(@total - 1)
      end

    end

    context 'when record not found' do

      # Use an ID not valid
      let(:course_id_false) { 1000 }

      before(:each) do
        delete(
          "/api/v1/courses/#{course_id_false}",
          params: {},
          headers: headers
        )
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

    end

    context 'when record is assigned to study programs' do

      # assign the course to one study program
      let!(:course_assigned) { create(:study_program_course, course_id: course_id, study_program_id: study_program_id, semester_number: 1)}

      before(:each) do
        delete(
          "/api/v1/courses/#{course_assigned.id}",
          params: {},
          headers: headers
        )
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:not_found)
      end

    end

  end

end
