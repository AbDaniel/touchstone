FactoryGirl.define do
  factory :choice do
    text 'Some Choice'
    correct false
    initialize_with { new(text, correct) }
  end

  factory :correct_choice, class: Choice do
    text 'Correct Choice'
    correct true
    initialize_with { new(text, correct) }
  end
end
