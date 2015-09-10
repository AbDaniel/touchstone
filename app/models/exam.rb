# == Schema Information
#
# Table name: exams
#
#  id          :integer          not null, primary key
#  code        :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#  detail      :string
#

class Exam < ActiveRecord::Base
  has_one :exam_configuration
  has_many :exam_groups
  has_many :groups, :through => :exam_groups

  def questions
    questions_by_config = []
    sections = exam_configuration.sections;
    sections.each do |section|
      questions_by_config << Question.includes(:categories).where(categories: {id: section.category.id}).order('RANDOM()').limit(section.no_of_questions)
    end
    questions_by_config.flatten!
  end

  validates_presence_of :code, :name, :description, :detail, :description
end
