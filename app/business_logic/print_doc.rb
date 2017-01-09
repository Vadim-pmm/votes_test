class PrintDoc < Prawn::Document
  require 'prawn/table'
  def initialize
    super(top_margin: 70)
    # font Rails.root.join("app/assets/fonts/OpenSans-Regular.ttf")
    font_families.update("MyFont" => {
        :normal => Rails.root.join("app/assets/fonts/OpenSans-Regular.ttf"),
        :bold => Rails.root.join("app/assets/fonts/OpenSans-Bold.ttf")
    })

    font "MyFont", size: 11
  end

  def create_content (q_no)
    move_down(20)
    @list = Question.where(question_box_id: q_no)
    image "#{Rails.root}/app/assets/images/GoldenGateHD.jpg", width: 530, height: 150
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..1).align = :right # правые колонки отформатируем вправо
      self.row_colors = ['DDDDDD', 'FFFFFF'] # черезстрочное закрашивание
      self.header = true # если заскочим на вторую страницу - то этот параметр позволит повторить заголовок на новой странице
      self.column_widths = [70, 250, 200]
    end
    move_down(20)
    text "Итоговый текст", size: 16, style: :bold
  end

  def line_item_rows
    [['Колонка 1', 'Колонка 2', 'Колонка 3']] +
        @list.map { |item| [item.id.to_s, item.name, 'Petya'] }
  end
end