class PollsController < ApplicationController
  include BusinessModule

  def index
  end

  def new
    @question_box_list = QuestionBox.pluck(:name, :id)
  end

  def create
    @qbox = QuestionBox.find(params[:qbox_id])
    @reply = @qbox.replies.new(params_permitted)
    @reply.save
    a=11

    # начинаем отвечать на вопросы
    redirect_to new_answer_path poll_id: @reply.id
  end

  def destroy
  end

  private
  def params_permitted
    params.permit(:name)
  end

end
