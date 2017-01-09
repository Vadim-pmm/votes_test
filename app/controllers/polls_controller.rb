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

    redirect_to new_poll_path
  end

  def destroy
    Poll.destroy(params[:id])
    redirect_to new_poll_path
  end

  private

  def params_permitted
    params.permit(:name)
  end

end
