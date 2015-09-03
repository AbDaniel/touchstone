FactoryGirl.define do
  factory :category do
    name 'Probability'

    factory :category_with_question do
      questions { [create(:question)] }
    end

  end
end
