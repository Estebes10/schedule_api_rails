require 'rails_helper'

RSpec.describe CourseProgram, type: :model do

  # Test associations
  it "belong to courses" do
    assc = described_class.reflect_on_association(:course)
    expect(assc.macro).to eq(:belongs_to)
  end

  it "belong to study programs" do
    assc = described_class.reflect_on_association(:study_program)
    expect(assc.macro).to eq(:belongs_to)
  end

end
