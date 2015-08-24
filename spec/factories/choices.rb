FactoryGirl.define do
  factory :choice do
    text 'Some Choice'
    correct false
    initialize_with { new(text, correct) }
  end
end
