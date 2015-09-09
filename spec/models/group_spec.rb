require 'rails_helper'

describe Group do
  let(:group) { FactoryGirl.create(:group) }

  subject { group }

  it { should be_valid }

  it { should validate_presence_of :name }
end
