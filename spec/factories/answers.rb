# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  exam_id     :integer
#  user_id     :integer
#  question_id :integer
#  answer      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :answer do
    exam nil
user nil
question nil
answer "MyString"
  end

end
