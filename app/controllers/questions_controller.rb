class QuestionsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
    @question = Question.find(params[:id])
    @possible_answers_list = @question.possible_answers.all
  end

  def update
  end

  def destroy
  end

  private

  def params_permitted
    params.permit(:name)
  end

end
