# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Category do

  let(:category) { FactoryGirl.build_stubbed(:category) }

  subject { category }

  describe '#valid?' do
    it { should be_valid }

    it 'is not valid without a name' do
      category = FactoryGirl.build(:category, name: nil)
      expect(category).to_not be_valid
    end
  end


end
