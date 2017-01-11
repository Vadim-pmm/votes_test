class CreateQuestionBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :question_boxes do |t|
      t.string :name

      t.timestamps
    end
  end
end
