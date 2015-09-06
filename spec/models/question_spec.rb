# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

describe Question, type: :model do

  let(:question) { FactoryGirl.build_stubbed(:question, categories: categories) }
  let(:categories) { [FactoryGirl.build_stubbed(:category)] }

  subject { question }

  describe '#valid?' do
    it 'is not a valid question without description' do
      question = FactoryGirl.build(:question, description: nil)
      expect(question).to_not be_valid
    end

    it 'is not valid without a category' do
      question = FactoryGirl.build(:question, categories: [])
      expect(question).to_not be_valid
    end

    it { should have_many(:choices) }

    it 'should have four choices' do
      question = FactoryGirl.create(:question)
      expect(question.choices.count).to eq(4)
    end
  end

end
