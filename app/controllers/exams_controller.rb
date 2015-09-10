class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :start]

  def index
    @exams = current_user.exams
  end

  def show
  end

  def start
    session[:exam_code] = @exam.code
  end

  private
  def set_exam
    @exam = Exam.find_by_id(params[:id])
  end
end
