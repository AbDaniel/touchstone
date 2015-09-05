require 'rails_helper'

describe ExamConfiguration do

  it { should belong_to :exam }

  it 'should be invalid without a duration' do
    exam = FactoryGirl.build(:exam_configuration, duration: nil)
    expect(exam).to_not be_valid
  end

end
