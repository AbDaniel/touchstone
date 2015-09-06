class ExamsController < ApplicationController
  before_action :set_exam, only: [:show]

  def index
    @exams = Exam.all
  end

  def show
  end

  private
  def set_exam
    @exam = Exam.find_by_id(params[:id])
  end
end
