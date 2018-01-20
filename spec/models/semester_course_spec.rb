require 'rails_helper'

RSpec.describe SemesterCourse, type: :model do

  # Test associations
  it 'belong to courses' do
    assc = described_class.reflect_on_association(:course)
    expect(assc.macro).to eq(:belongs_to)
  end

  it 'belong to semesters' do
    assc = described_class.reflect_on_association(:semester)
    expect(assc.macro).to eq(:belongs_to)
  end

end
