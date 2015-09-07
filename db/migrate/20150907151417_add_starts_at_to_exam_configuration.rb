class AddStartsAtToExamConfiguration < ActiveRecord::Migration
  def change
    add_column :exam_configurations, :starts_at, :datetime
  end
end
