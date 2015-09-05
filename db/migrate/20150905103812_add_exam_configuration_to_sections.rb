class AddExamConfigurationToSections < ActiveRecord::Migration
  def change
    add_reference :sections, :exam_configuration, index: true, foreign_key: true
  end
end
