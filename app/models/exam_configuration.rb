# == Schema Information
#
# Table name: exam_configurations
#
#  id         :integer          not null, primary key
#  exam_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  duration   :string
#

class ExamConfiguration < ActiveRecord::Base
  belongs_to :exam

  validates_presence_of :duration
end
