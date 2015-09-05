# == Schema Information
#
# Table name: sections
#
#  id              :integer          not null, primary key
#  category_id     :integer
#  no_of_questions :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :section do
    category { create(:category) }
    no_of_questions 1
  end

end
