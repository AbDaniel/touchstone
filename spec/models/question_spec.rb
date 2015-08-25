require 'rails_helper'

describe Question, type: :model do

  it { should have_many(:choice) }

  describe '#valid?' do
    it 'is a a valid question' do
      question = FactoryGirl.build(:question)
      expect(question).to be_valid
    end

    it 'is not a valid question without description' do
      question = FactoryGirl.build(:question, description: nil)
      expect(question).to_not be_valid
    end
  end

end
