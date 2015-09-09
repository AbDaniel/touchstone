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

require 'rails_helper'

describe Answer do

  it { should belong_to :exam }
  it { should belong_to :question }
  it { should belong_to :user }
  it { should be_valid }

end
