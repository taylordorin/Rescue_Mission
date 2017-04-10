class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = 'Question was successfully saved!'
      redirect_to @question
    else
      render action: 'new'
    end
  end


  private

  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
