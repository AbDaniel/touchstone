# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do

  factory :question do
    description "MyString"

    categories { [create(:category)] }

    choices { build_list(:choice, 4) }
  end
end
