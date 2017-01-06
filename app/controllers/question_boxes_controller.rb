class QuestionBoxesController < ApplicationController
  layout 'application'

  def index
  end

  def new
    @question_boxes_list = QuestionBox.all.order(:created_at)
  end

  def create
    @question_box = QuestionBox.new(params_permitted)
    @question_box.save

    redirect_to new_question_box_path
  end

  def edit
    # здесь создается новый вопрос, входящий в этот Box
    @question_box = QuestionBox.find(params[:id])
    @questions_list = @question_box.questions.all

  end

  def update
    # я здесь апдейчу не сам Box, а состав вопросов в него входящий
    @question_box = QuestionBox.find(params[:id])
    @question = @question_box.questions.new(params_permitted)
    @question.save

    redirect_to edit_question_box_path
  end

  def destroy
  end

  private

  def params_permitted
    params.permit(:name)
  end

end
