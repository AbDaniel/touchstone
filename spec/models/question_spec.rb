require 'rails_helper'

describe Question, type: :model do

  let(:question) { FactoryGirl.build(:question) }

  subject { question }

  it { should have_many(:choices) }

  it { should be_valid }

  it 'is not a valid question without description' do
    question = FactoryGirl.build(:question, description: nil)
    expect(question).to_not be_valid
  end

  it 'is valid if it has four choices'
  it 'is not valid if it has less than four choices'
  it 'is not valid if it has more than three choices'
end