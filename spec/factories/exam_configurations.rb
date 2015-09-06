# == Schema Information
#
# Table name: exam_configurations
#
#  id         :integer          not null, primary key
#  exam_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  duration   :string
#

FactoryGirl.define do
  factory :exam_configuration do
    exam { create(:exam) }
    duration '1 hour'
  end

end
