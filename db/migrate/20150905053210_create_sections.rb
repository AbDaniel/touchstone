class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :category, index: true, foreign_key: true
      t.integer :no_of_questions

      t.timestamps null: false
    end
  end
end
