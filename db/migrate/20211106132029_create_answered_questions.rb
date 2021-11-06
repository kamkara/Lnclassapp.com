class CreateAnsweredQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :answered_questions, id: :uuid do |t|
      t.references :answer, null: false, foreign_key: true, type: :uuid
      t.references :question, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
