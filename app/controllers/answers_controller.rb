class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = 'Answer was successfully saved!'
      redirect_to question_path(@question)
    else
      @answers = @question.answers
      render "questions/show"
    end
  end


  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
