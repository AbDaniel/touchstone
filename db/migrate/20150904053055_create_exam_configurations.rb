class CreateExamConfigurations < ActiveRecord::Migration
  def change
    create_table :exam_configurations do |t|
      t.references :exam, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
