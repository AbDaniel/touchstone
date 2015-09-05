FactoryGirl.define do
  factory :section do
    category { create(:category) }
    no_of_questions 1
  end

end
