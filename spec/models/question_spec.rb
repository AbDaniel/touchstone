require 'rails_helper'

describe Question, type: :model do

  let(:question) { FactoryGirl.create(:question_with_choices) }

  subject { question }

  it 'is not a valid question without description' do
    question = FactoryGirl.build(:question, description: nil)
    expect(question).to_not be_valid
  end

  context 'question with choices' do

    it { should have_many(:choices) }

    it 'should have four choices' do
      expect(question.choices.count).to eq(4)
    end
    
  end

end