require 'rails_helper'

describe ExamsController do
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
    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:exam) { FactoryGirl.create(:exam) }

    it 'assign the requested exam to @exam' do
      get :show, id: exam
      expect(assigns(:exam)).to eq exam
    end
    it 'renders the :show view' do
      get :show, id: exam
      expect(response).to render_template :show
    end
  end

  describe 'GET #start' do
    it 'redirects to exam#question'
    context 'exam is not yet started' do
      it 'sets exam code in current session' do
        exam = FactoryGirl.create(:exam, code: 'CS101')
        expect(session[:exam_code]).to be_nil
        get :start, id: exam
        expect(session[:exam_code]).to eq 'CS101'
      end
      it 'populates session with questions based on exam configuration'
    end
    context 'exam is already started' do
      it 'does not populate session'
    end
  end

  describe 'GET #question' do
    it 'populates the question from session based on question number'
    it 'populates the question from session based on question number'
  end

end