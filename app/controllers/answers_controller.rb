class AnswersController < ApplicationController

  def new

    # при первом входе в создание ответов - запоминаем - из какого
    a=11
    session[:current_poll_id] = params[:poll_id] if (
        session[:current_poll_id].nil? || # если первый вход
        ((session[:current_poll_id] !=  params[:poll_id]) && # если вход из другого poll, но не из внутреннего
        !params[:poll_id].nil?))
    a=11
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
    @poll = Poll.find(session[:current_poll_id])
    answer = @poll.answers.new(params_permitted)
    answer.save
    a=11
    redirect_to new_answer_path
  end

  def find_next_question(current_poll)
    # ищем уже отвеченные вопросы
    answers = Answer.where(poll_id: current_poll).pluck(:question_id)

    # сначала ищем созданный пустой Опрос.
    @poll = Poll.find(current_poll)
    # Теперь ищем все неотвеченные вопросы в вопроснике
    questions = @poll.question_box.questions.pluck(:id)

    new_question_id = (questions - answers)[0]
    a=11
    @poll.question_box.questions.find(new_question_id)
  end

  def all_answered?(current_poll)
    a=11
    answers = Answer.where(poll_id: current_poll).count

    @poll = Poll.find(current_poll)
    questions = @poll.question_box.questions.count

    (questions == answers)

  end

  private

  def params_permitted
    a=11
    params.permit(:name, :question_id)
  end

end
