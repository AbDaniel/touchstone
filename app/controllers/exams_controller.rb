class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def index
    @exams = Exam.all
  end

  def show
  end
end
