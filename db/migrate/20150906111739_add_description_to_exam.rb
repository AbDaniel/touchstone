class AddDescriptionToExam < ActiveRecord::Migration
  def change
    add_column :exams, :description, :string
  end
end
