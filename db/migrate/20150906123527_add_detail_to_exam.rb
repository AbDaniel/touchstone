class AddDetailToExam < ActiveRecord::Migration
  def change
    add_column :exams, :detail, :string
  end
end
