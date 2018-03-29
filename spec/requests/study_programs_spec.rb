# This file implements a suit of tests for Career API endpoint requests in the
# public page (signup)
require 'rails_helper'

RSpec.describe 'StudyPrograms API', type: :request do

  before(:each) do
    @total = 10
  end

  # create deparment
  let(:department) { create(:department) }

  # create deparment
  let(:career) { create(:career, department_id: department.id) }

  # create deparment
  let(:career_id) { career.id }

  # create a list of 10 careers
  let!(:study_programs) { create_list(:study_program, @total, career_id: career.id) }

  # Career GET test suite
  describe 'GET /careers/career_id/study_programs' do

    context 'when valid request' do

      # Before each test execute request
      before(:each) do
        get(
          "/careers/#{career_id}/study_programs",
          params: {},
          headers: {}
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
        StudyProgram.destroy_all
      end

      # make HTTP get request before each example
      before(:each) do
        get("/careers/#{career_id}/study_programs", params: {}, headers: {})
      end

      it 'not returns careers' do
        expect(response.body).to be_empty
      end

      it 'returns a no content status' do
        expect(response).to have_http_status(204)
      end

    end

  end

end
