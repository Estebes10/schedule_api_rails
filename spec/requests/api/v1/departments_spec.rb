# This file implements a suit of tests for Department API endpoint requests
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

  # Use the first department
  let!(:department_id) { departments.first.id }

  # Test suite for GET /api/v1/departments
  describe 'GET /api/v1/departments' do

    context 'when departments exist' do

      # make HTTP get request before each example
      before { get '/api/v1/departments', params: {}, headers: headers }

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

      # Destroy all records to get nothing
      before(:each) do
        Department.destroy_all
      end

      # make HTTP get request before each example
      before { get '/api/v1/departments', params: {}, headers: headers }

      it 'not returns departments' do
        expect(json).to be_empty
      end

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(422)
      end

    end

  end

  # Test suite for GET api/v1/departments/:id
  describe 'GET /api/v1/departments/:id' do

    # Make request to the URL to get one department
    before(:each) do
      get(
        "/api/v1/departments/#{department_id}",
        params: {},
        headers: headers
      )
    end

    context 'when record exists' do

      it 'returns the department' do
        expect(json).not_to be_empty
      end

      it 'returns an ok status code' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when the record does not exists' do

      # use an ID that not exists
      let(:department_id) { 1000 }

      it 'returns not found status code' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body)
          .to match(/Couldn't find Department with 'id'=#{department_id}/)
      end

    end

  end

  # Test suit for POST api/v1/departments
  describe 'POST /api/v1/departments' do

    let(:valid_attributes) do
      {
        name:        'Departamento de Tecnologías de Información y Comunicacion',
        code:        'TC101001',
        description: 'Departamento de sistemas computaciones',
        status:      true,
        campu_id:    campus.id,
      }.to_json
    end

    context 'when request is valid' do

      # Make a request before validate if the department is saved correctly
      before(:each) do
        post '/api/v1/departments', params: valid_attributes, headers: headers
      end

      it 'returns the department created' do
        department = Department.last

        expect(department.name)
          .to eq('Departamento de Tecnologías de Información y Comunicacion')
      end

      it 'returns status code ok' do
        expect(response).to have_http_status(201)
      end

    end

    context 'when the request is invalid' do

      # Create a request without the code of the department and the campu_id
      let(:invalid_attributes) do
        {
          name:        Faker::Job.field,
          status:      true,
          description: 'This is a invalid request',
        }.to_json
      end

      before(:each) do
        post '/api/v1/departments', params: invalid_attributes, headers: headers
      end

      it 'return unprocessable entity code' do
        expect(response).to have_http_status(422)
      end

      it 'return a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Campu must exist, Code can't be blank/)
      end

    end

  end

  # Test suite for PUT /api/v1/departments/:id
  describe 'PUT /api/v1/departments/:id' do

    # Set of valid attributes to change one record of departments
    let(:valid_attributes) do
      {
        name:        'Departamento de Tecnologias',
        code:        'DPT1932',
        description: 'Departamento de TIs',
        status:      true,
      }.to_json
    end

    before(:each) do
      @department = departments.first
    end

    context 'when the record exists' do

      # Make request with the parameters
      before(:each) do
        put(
          "/api/v1/departments/#{department_id}",
          params: valid_attributes,
          headers: headers
        )
      end

      # Test if the attributes are changed
      it 'contains the new name' do
        @department.reload
        expect(@department.name).to eq('Departamento de Tecnologias')
      end

      it 'contains the new code' do
        @department.reload
        expect(@department.code).to eq('DPT1932')
      end

      it 'contains the new description' do
        @department.reload
        expect(@department.description).to eq('Departamento de TIs')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(:ok)
      end

    end

    context 'when attributes are not valid' do

      # testing sent an empty name
      before(:each) do
        put(
          "/api/v1/departments/#{department_id}",
          params: { name: nil }.to_json,
          headers: headers
        )
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      # test that the attributes are not changed
      it 'not contains the new name' do
        expect(@department.name).not_to eq('Departamento de Tecnologias')
      end

      it 'not contains the new description' do
        expect(@department.code).not_to eq('DPT1932')
      end

    end

    context 'when the record does not exist' do

      # Use an ID not valid
      let(:id_false) { 100 }

      # request with a false ID
      before(:each) do
        put(
          "/api/v1/departments/#{id_false}",
          params: valid_attributes,
          headers: headers
        )
      end

      it 'not updates the record' do
        expect(@department.name).not_to eq('Departamento de Tecnologias')
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body)
          .to match(/Couldn't find Department with 'id'=#{id_false}/)
      end

    end

    context 'when invalid headers' do

      # Use no valid headers (token not given)
      let(:no_token) { invalid_headers }

      before(:each) do
        put(
          "/api/v1/departments/#{department_id}",
          params: valid_attributes,
          headers: no_token
        )
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(422)
      end

    end

  end

  # Test suite for DELETE /departments/:id
  describe 'DELETE /api/v1/departments/:id' do

    context 'when record exists' do

      before(:each) do
        delete(
          "/api/v1/departments/#{department_id}",
          params: {},
          headers: headers
        )
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'reduces the records of the departments table' do
        expect(Department.count).to eq(@total - 1)
      end

    end

    context 'when records not found' do

      # Use and ID not valid
      let(:not_valid_id) { 1000 }

      before(:each) do
        delete(
          "/api/v1/departments/#{not_valid_id}",
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
