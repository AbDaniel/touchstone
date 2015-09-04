class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
