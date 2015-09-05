# == Schema Information
#
# Table name: exams
#
#  id         :integer          not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :exam do
    code "CS-101"
    name "Introduction to CS"
  end
end
