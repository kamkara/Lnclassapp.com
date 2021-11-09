class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions, id: :uuid do |t|
      t.text :content
      t.text :explain_answer
      t.references :exercice, null: false, foreign_key: true, type: :uuid
      #t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
