FactoryGirl.define do

  factory :exam_configuration do
    category { create(:category) }
    exam { create(:exam) }
  end

end
