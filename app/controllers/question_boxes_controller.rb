class QuestionBoxesController < ApplicationController
  layout 'application'
  before_action :set_qbox, only: [:show, :edit, :update]

  def index
  end

  def show
    @questions_list = @question_box.questions.paginate(:page => params[:page], :per_page => 7)
  end

  def new
    @question_boxes_list = QuestionBox.all.order(:created_at)
  end

  def create
    @question_box = QuestionBox.new(params_permitted)
    if @question_box.save
      flash[:notice] = 'Successfully created !'
    else
      flash[:error] = 'Something wrong'
    end
    redirect_to new_question_box_path
  end

  def edit
    # здесь создается новый вопрос, входящий в этот Box
    @questions_list = @question_box.questions.paginate(:page => params[:page], :per_page => 7)

  end

  def update
    # я здесь апдейчу не сам Box, а состав вопросов в него входящий
    @question = @question_box.questions.new(params_permitted)
    if @question.save
      flash[:notice] = 'Successfully updated !'
    else
      flash[:error] = 'Something wrong'
    end

    redirect_to edit_question_box_path
  end

  def destroy
  end

  def print
    doc = PrintDoc.new
    doc.create_content(params[:id])
    send_data doc.render, filename:"1", type: "application/pdf", disposition: "inline"
  end

  private

  def set_qbox
    @question_box = QuestionBox.find(params[:id])
  end

  def params_permitted
    params.permit(:name)
  end

end
