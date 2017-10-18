require 'rails_helper'

RSpec.describe Assignment, type: :model do

  it "belong to roles" do
    assc = described_class.reflect_on_association(:role)
    expect(assc.macro).to eq(:belongs_to)
  end

  it "belong to users" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq(:belongs_to)
  end

  it { should belong_to(:role) }
  it { should belong_to(:user) }

end
