FactoryGirl.define do
  factory :exam_configuration do
    exam { create(:exam) }
  end

end
