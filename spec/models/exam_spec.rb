# == Schema Information
#
# Table name: exams
#
#  id          :integer          not null, primary key
#  code        :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#  detail      :string
#

require 'rails_helper'

describe Exam do

  let(:exam) { FactoryGirl.build_stubbed(:exam) }

  subject { exam }

  describe '#valid?' do
    it { should be_valid }

    it { should have_one(:exam_configuration) }

    it 'is not valid without exam code' do
      exam = FactoryGirl.build(:exam, code: nil)
      expect(exam).to_not be_valid
    end

    it 'is not valid without exam name' do
      exam = FactoryGirl.build(:exam, name: nil)
      expect(exam).to_not be_valid
    end

    it { should validate_presence_of :description }
    it { should validate_presence_of :detail }
  end

end
