class ExamConfiguration < ActiveRecord::Base
  belongs_to :exam

  validates_presence_of :duration
end
