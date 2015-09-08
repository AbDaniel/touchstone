require 'rails_helper'

RSpec.describe ExamsController, type: :controller do
  login_user

  it 'should have a current_user' do
    expect(subject.current_user).to_not be_nil
  end

  describe 'GET #index' do
    it 'populates an array of exams' do
      exam = FactoryGirl.create(:exam)
      get :index
      expect(assigns(:exams)).to eq([exam])
    end
  end

end
