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
    it { should have_many(:groups).through(:exam_groups) }
  end

  describe '#questions' do
    before(:each) do
      @probability_category = FactoryGirl.create(:category, name: 'Probability')
      @expected_questions = []
      @expected_questions << FactoryGirl.create(:question, categories: [@probability_category],
                                                description: 'Probability Question',
                                                choices: [create(:choice, text: 'Choice 1'),
                                                          create(:choice, text: 'Choice 2'),
                                                          create(:choice, text: 'Choice 3', correct: true),
                                                          create(:choice, text: 'Choice 4')]).id

      algebra_category = FactoryGirl.create(:category, name: 'Algebra')
      @expected_questions << FactoryGirl.create(:question,
                                                categories: [algebra_category],
                                                description: 'Algebra Question',
                                                choices: [create(:choice, text: 'Choice 1'),
                                                          create(:choice, text: 'Choice 2'),
                                                          create(:choice, text: 'Choice 3', correct: true),
                                                          create(:choice, text: 'Choice 4')]).id

      permutation_category = FactoryGirl.create(:category, name: 'Permutation')
      FactoryGirl.create(:question,
                         categories: [permutation_category],
                         description: 'Permutation Question',
                         choices: [create(:choice, text: 'Choice 1'),
                                   create(:choice, text: 'Choice 2'),
                                   create(:choice, text: 'Choice 3', correct: true),
                                   create(:choice, text: 'Choice 4')])

      exam_configuration = FactoryGirl.build(:exam_configuration,
                                             sections: [create(:section, category: @probability_category, no_of_questions: 1),
                                                        create(:section, category: algebra_category, no_of_questions: 1)])
      @exam = FactoryGirl.create(:exam,
                                 name: 'CS:101',
                                 exam_configuration: exam_configuration)
    end

    it 'does not return an empty list' do
      expect(@exam.questions).to_not be_empty
    end

    it 'returns a list of question based on categories in exam configuration' do
      expected = Question.includes(:categories).where(id: @expected_questions)
      actual = @exam.questions
      expect(actual).to match_array(expected)
    end

    it 'returns a list of question based on categories and no of questions in exam configuration' do
      FactoryGirl.create(:question,
                         categories: [@probability_category],
                         description: 'Probability Question',
                         choices: [create(:choice, text: 'Choice 1'),
                                   create(:choice, text: 'Choice 2'),
                                   create(:choice, text: 'Choice 3', correct: true),
                                   create(:choice, text: 'Choice 4')])

      expected = Question.includes(:categories).where(id: @expected_questions)
      actual = @exam.questions
      expect(actual).to match_array(expected)
    end
  end

end
