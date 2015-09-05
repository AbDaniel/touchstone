class AddDurationToExamConfiguration < ActiveRecord::Migration
  def change
    add_column :exam_configurations, :duration, :interval
  end
end
