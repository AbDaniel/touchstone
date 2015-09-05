# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  text        :string
#  correct     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#

FactoryGirl.define do
  factory :choice do
    correct false
    text "Some Choice"
  end
end
