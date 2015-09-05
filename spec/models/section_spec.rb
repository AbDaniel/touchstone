# == Schema Information
#
# Table name: sections
#
#  id                    :integer          not null, primary key
#  category_id           :integer
#  no_of_questions       :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  exam_configuration_id :integer
#

require 'rails_helper'


describe Section do

  let(:section) { FactoryGirl.create(:section) }

  subject { section }

  it { should be_valid }

  describe '#valid?' do
    it 'is invalid if category is not present' do
      section = FactoryGirl.build(:section, category: nil)
      expect(section).to_not be_valid
    end

    it 'is invalid without no of questions' do
      section = FactoryGirl.build(:section, no_of_questions: nil)
      expect(section).to_not be_valid
    end

    it 'is invalid when no of questions is less than one' do
      section = FactoryGirl.build(:section, no_of_questions: -1)
      expect(section).to_not be_valid
    end

    it { should belong_to :exam_configuration }
  end

end
