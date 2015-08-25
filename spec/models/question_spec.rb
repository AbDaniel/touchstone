require 'rails_helper'

describe Question, type: :model do
  describe '#valid?' do
    it 'should be a valid question' do
      question = FactoryGirl.build(:question)
      expect(question).to be_valid
    end
  end
end
