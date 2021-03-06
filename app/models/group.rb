# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  has_many :user_groups
  has_many :users, :through => :user_groups
  has_many :exam_groups
  has_many :exams, :through => :exam_groups

  validates_presence_of :name
end
