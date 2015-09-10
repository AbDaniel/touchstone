class CreateExamGroups < ActiveRecord::Migration
  def change
    create_table :exam_groups do |t|
      t.references :group, index: true, foreign_key: true
      t.references :exam, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
