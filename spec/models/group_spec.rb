# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Group do
  let(:group) { FactoryGirl.create(:group) }

  subject { group }

  it { should be_valid }

  it { should validate_presence_of :name }

  it { should have_many(:users).through(:user_groups) }

  it { should have_many(:exams).through(:exam_groups) }
end
