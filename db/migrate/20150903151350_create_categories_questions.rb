class CreateCategoriesQuestions < ActiveRecord::Migration
  def change
    create_table :categories_questions, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :question, index: true
    end
  end
end
