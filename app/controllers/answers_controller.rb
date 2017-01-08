class AnswersController < ApplicationController

  def new

    # при первом входе в создание ответов - запонимаем - из какого
    session[:current_poll_id] ||= params[:poll_id]

    if all_answered?(session[:current_poll_id])
      session[:current_poll_id] = nil
      redirect_to root_path
    else
      # ищем очередной неотвеченный вопрос
      @question = find_next_question(session[:current_poll_id])
      a=11
      render 'new'
    end
  end

  def create
    @poll = Reply.find(session[:current_poll_id])
    answer = @poll.answers.new(params_permitted)
    answer.save
    a=11
    redirect_to new_answer_path
  end

  def find_next_question(current_poll)
    # ищем уже отвеченные вопросы
    answers = Answer.where(reply_id: current_poll).pluck(:question_id)

    # сначала ищем созданный пустой Опрос.
    @poll = Reply.find(current_poll)
    # Теперь ищем все неотвеченные вопросы в вопроснике
    questions = @poll.question_box.questions.pluck(:id)

    new_question_id = (questions - answers)[0]
    a=11
    @poll.question_box.questions.find(new_question_id)
  end

  def all_answered?(current_poll)
    answers = Answer.where(reply_id: current_poll).count

    @poll = Reply.find(current_poll)
    questions = @poll.question_box.questions.count

    (questions == answers)

  end

  private

  def params_permitted
    a=11
    params.permit(:name, :question_id)
  end

end
