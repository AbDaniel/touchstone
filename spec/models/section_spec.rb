require 'rails_helper'

describe Section do

  let(:section) { FactoryGirl.create(:section) }

  subject { section }

  it { should be_valid }

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

end
