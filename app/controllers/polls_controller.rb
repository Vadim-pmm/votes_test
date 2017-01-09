class PollsController < ApplicationController
  include BusinessModule

  def index
  end

  def new
    @question_box_list = QuestionBox.pluck(:name, :id)
    @polls_list = Poll.all.order(created_at: :desc)
  end

  def create
    @qbox = QuestionBox.find(params[:qbox_id])
    @poll = @qbox.polls.new(params_permitted)
    @poll.save

    # начинаем отвечать на вопросы
    redirect_to new_answer_path poll_id: @poll.id
  end

  def destroy
    a=11
    poll = Poll.destroy(params[:id])
    redirect_to new_poll_path
  end

  private
  def params_permitted
    params.permit(:name)
  end

end
