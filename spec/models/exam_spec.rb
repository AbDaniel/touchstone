require 'rails_helper'

describe Exam do
  let(:exam) { FactoryGirl.create(:exam) }

  subject { exam }

  it { should be_valid }

  it 'is not valid without exam code' do
    exam = FactoryGirl.build(:exam, code: nil)
    expect(exam).to_not be_valid
  end

  it 'is not valid without exam name' do
    exam = FactoryGirl.build(:exam, name: nil)
    expect(exam).to_not be_valid
  end

end
