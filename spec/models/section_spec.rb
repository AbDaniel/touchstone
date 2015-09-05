require 'rails_helper'

describe Section do

  let(:section) { FactoryGirl.create(:section) }

  subject { section }

  it { should be_valid }

  it 'is not valid if category is not present' do
    section = FactoryGirl.build(:section, category: nil)
    expect(section).to_not be_valid
  end

end
