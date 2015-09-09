# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  exam_id     :integer
#  user_id     :integer
#  question_id :integer
#  answer      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :wrong_answer do
    exam { create(:exam) }
    user { create(:user) }
    question { create(:question,
                      choices: [create(:choice, text: 'Choice 1'), create(:choice, text: 'Choice 2'),
                                create(:choice, text: 'Choice 3', correct: true), create(:choice, text: 'Choice 4')])
    }
    answer 'Choice 3'
  end
  factory :correct_correct do
    exam { create(:exam) }
    user { create(:user) }
    question { create(:question,
                      choices: [create(:choice, text: 'Choice 1'), create(:choice, text: 'Choice 2'),
                                create(:choice, text: 'Choice 3', correct: true), create(:choice, text: 'Choice 4')])
    }
    answer 'Choice 2'
  end
end
