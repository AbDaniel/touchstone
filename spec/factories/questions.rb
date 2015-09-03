FactoryGirl.define do

  factory :question do
    description "MyString"

    factory :question_with_categories do
      categories { [create(:category)] }
    end

    factory :question_with_choices do
      transient do
        choice_count 4
      end
      after(:create) do |question, evaluator|
        create_list(:choice, evaluator.choice_count, question: question)
      end
    end

  end
end
