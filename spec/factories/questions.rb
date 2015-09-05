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

    transient do
      choice_count 4
    end
    after(:create) do |question, evaluator|
      create_list(:choice, evaluator.choice_count, question: question)
    end

  end
end
