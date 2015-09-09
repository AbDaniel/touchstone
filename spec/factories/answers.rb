# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  exam_id     :integer
#  user_id     :integer
#  question_id :integer
#  text        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :correct_answer, class: Answer do
    exam { create(:exam) }
    user { create(:user) }
    question { create(:question,
                      choices: [create(:choice, text: 'Choice 1'), create(:choice, text: 'Choice 2'),
                                create(:choice, text: 'Choice 3', correct: true), create(:choice, text: 'Choice 4')])
    }
    text 'Choice 3'
  end
  factory :wrong_answer, class: Answer do
    exam { create(:exam) }
    user { create(:user) }
    question { create(:question,
                      choices: [create(:choice, text: 'Choice 1'), create(:choice, text: 'Choice 2'),
                                create(:choice, text: 'Choice 3', correct: true), create(:choice, text: 'Choice 4')])
    }
    text 'Choice 2'
  end
end
