class PollsController < ApplicationController

  def new
    @question_box_list = QuestionBox.pluck(:name, :id)
    @polls_list = Poll.includes(:question_box).all.order(created_at: :desc)
  end

  def create
    @qbox = QuestionBox.find(params[:qbox_id])
    @poll = @qbox.polls.new(params_permitted)

    if @poll.save
      flash[:notice] = 'Successfully created !'
    else
      flash[:error] = 'Something wrong'
    end

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
