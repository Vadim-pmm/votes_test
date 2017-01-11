class CreatePossibleAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :possible_answers do |t|
      t.string :name
      t.references :question

      t.timestamps
    end
  end
end
