class QuestionsController < ApplicationController

  def edit
    @question = Question.find(params[:id])
    @possible_answers_list = @question.possible_answers.all
  end


  private

  def params_permitted
    params.permit(:name)
  end

end
