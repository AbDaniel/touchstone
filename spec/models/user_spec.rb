 # == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  role                   :integer
#

describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  it 'should be a valid user' do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it { should have_many(:groups).through(:user_groups) }

  describe '#exams' do
    before(:each) do
      @expected_exam = []
      FactoryGirl.create(:exam, code: 'CS-103')
      @group = FactoryGirl.build(:group, name: 'CSE-A', exams: [create(:exam, code: 'CS-101'),
                                                                create(:exam, code: 'CS-102')])
      @user = FactoryGirl.create(:user,
                                 email: 'email@exmaple.com',
                                 groups: [@group])
    end

    subject { @user }

    it 'returns a list of exams tagged to it' do
      expected = Exam.where(code: %w(CS-101 CS-102))
      expect(@user.exams).to match_array(expected)
    end
  end

end
