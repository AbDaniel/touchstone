class ExamConfiguration < ActiveRecord::Base
  belongs_to :category
  belongs_to :exam
end
