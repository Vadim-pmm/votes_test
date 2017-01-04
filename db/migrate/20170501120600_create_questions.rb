class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string     :name, null: false
      t.integer    :num_no
      t.integer    :kind
      t.references :poll
      t.integer    :page_no

      t.timestamps
    end
  end
end
