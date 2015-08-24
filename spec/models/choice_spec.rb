require 'rails_helper'

describe Choice do
  describe '#valid?' do
    it 'is invalid without text' do
      choice = FactoryGirl.build(:choice, :text => nil)
      expect(choice).to_not be_valid
    end
    it 'is valid with text' do
      choice = FactoryGirl.build(:choice)
      expect(choice).to be_valid
    end
  end
end
