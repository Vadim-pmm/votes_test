class AnswersController < ApplicationController

  def proceed_poll
    # при первом входе в создание ответов - запоминаем - из какого
    a=11
    session[:current_poll_id] = params[:id] if (
        session[:current_poll_id].nil? || # если первый вход
        ((session[:current_poll_id] !=  params[:id]) && # если вход из другого poll, но не из внутреннего
        !params[:id].nil?))

    if all_answered?(session[:current_poll_id])
      session[:current_poll_id] = nil
      redirect_to root_path
    else
      # ищем очередной неотвеченный вопрос
      @question = find_next_question(session[:current_poll_id])

      render 'proceed_poll'
    end
  end

  def create
    @poll = Poll.find(session[:current_poll_id])
    answer = @poll.answers.new(params_permitted)
    answer.save

    # не меняя сессию, которая содержит параметр текущего poll-а - повторяем цикл.
    redirect_to proceed_path(session[:current_poll_id])
  end

  def find_next_question(current_poll)
    # ищем уже отвеченные вопросы
    answers = Answer.where(poll_id: current_poll).pluck(:question_id)

    # сначала ищем созданный пустой Опрос.
    @poll = Poll.find(current_poll)
    # Теперь ищем все неотвеченные вопросы в вопроснике
    questions = @poll.question_box.questions.pluck(:id)

    new_question_id = (questions - answers)[0]
    @poll.question_box.questions.find(new_question_id)
  end

  def all_answered?(current_poll)
    answers = Answer.where(poll_id: current_poll).count
    @poll = Poll.find(current_poll)
    questions = @poll.question_box.questions.count
    (questions == answers)
  end

  private

  def params_permitted
    params.permit(:name, :question_id)
  end

end
