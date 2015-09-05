# == Schema Information
#
# Table name: exam_configurations
#
#  id         :integer          not null, primary key
#  exam_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  duration   :string
#

require 'rails_helper'

describe ExamConfiguration do

  it { should belong_to :exam }

  it 'should be invalid without a duration' do
    exam = FactoryGirl.build(:exam_configuration, duration: nil)
    expect(exam).to_not be_valid
  end

end
