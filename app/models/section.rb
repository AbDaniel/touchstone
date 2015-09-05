# == Schema Information
#
# Table name: sections
#
#  id              :integer          not null, primary key
#  category_id     :integer
#  no_of_questions :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Section < ActiveRecord::Base
  belongs_to :category
  belongs_to :exam_configuration

  validates_presence_of :category
  validates :no_of_questions, presence: true,
            numericality: {
                only_integer: true,
                greater_than: 0
            }
end
