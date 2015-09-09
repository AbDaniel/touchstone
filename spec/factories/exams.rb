# == Schema Information
#
# Table name: exams
#
#  id          :integer          not null, primary key
#  code        :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#  detail      :string
#

FactoryGirl.define do
  factory :exam do
    code 'CS-101'
    name 'Introduction to CS'
    description 'Test your CS Skills'
    detail 'A Long descriptive detail which I dont have time write'
    exam_configuration nil

    factory :exam_with_exam_configuration do
      after(:create) do |exam|
        create(:exam_configuration, exam: exam)
      end
    end
  end
end
