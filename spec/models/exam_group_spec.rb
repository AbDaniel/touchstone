# == Schema Information
#
# Table name: exam_groups
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  exam_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ExamGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
