require 'rails_helper'

describe Category do

  let(:category) { FactoryGirl.create(:category) }

  subject { category }

  it { should be_valid }

  it 'is not valid without a name' do
    category = FactoryGirl.build(:category, name: nil)
    expect(category).to_not be_valid
  end

  it 'has a list of question' do
    category = FactoryGirl.create(:category_with_question)
    expect(category.questions.size).to be 1
  end

end
