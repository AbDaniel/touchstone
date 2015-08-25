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

end
