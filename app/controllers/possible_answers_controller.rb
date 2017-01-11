class PossibleAnswersController < ApplicationController
  def index
  end

  def new
  end

  def create
    # сюда залетаем из вьюхи questions.edit
    @question = Question.find(params[:question_id])
    @possible_answer = @question.possible_answers.new(params_permitted)
    @possible_answer.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @item_to_delete = PossibleAnswer.find(params[:id])
    @item_to_delete.delete

    respond_to do |format|
      format.js
    end

  end

  private

  def params_permitted
    params.permit(:name)
  end

end
