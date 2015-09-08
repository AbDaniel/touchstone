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
    it { should be_valid }

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

    it 'it is not valid when choices are more than four' do
      choices = FactoryGirl.build_list(:choice, 5)
      question = FactoryGirl.build(:question, choices: choices)
      expect(question).to_not be_valid
    end

    it 'it is not valid when choices are not unique' do
      choices = FactoryGirl.build_list(:choice, 4, text: 'Same Choice')
      question = FactoryGirl.build_stubbed(:question, choices: choices)
      expect(question).to_not be_valid
    end
  end

  describe '#correct_choice' do
    context 'given a choice' do
      it 'is true if choice is the correct choice' do
        wrong_choice = FactoryGirl.build_stubbed(:choice)
        correct_choice = FactoryGirl.build_stubbed(:choice, correct: true)
        question = FactoryGirl.build_stubbed(:question, choices: [wrong_choice, correct_choice])
        expect(question.correct_choice?(correct_choice.text)).to be true
      end
      it 'is false if choice is the wrong choice' do
        wrong_choice = FactoryGirl.build_stubbed(:choice)
        correct_choice = FactoryGirl.build_stubbed(:choice, correct: true)
        question = FactoryGirl.build_stubbed(:question, choices: [wrong_choice, correct_choice])
        expect(question.correct_choice?(wrong_choice.text)).to be false
      end
    end
  end

end
