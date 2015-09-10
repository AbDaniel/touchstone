# == Schema Information
#
# Table name: exam_groups
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  exam_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExamGroup < ActiveRecord::Base
  belongs_to :group
  belongs_to :exam
end
