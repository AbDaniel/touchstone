# == Schema Information
#
# Table name: exam_groups
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  exam_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :exam_group do
    group nil
exam nil
  end

end
