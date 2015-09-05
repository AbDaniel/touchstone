require 'rails_helper'

describe Section do

  let(:section) { FactoryGirl.create(:section) }

  subject { section }

  it { should be_valid }

end
