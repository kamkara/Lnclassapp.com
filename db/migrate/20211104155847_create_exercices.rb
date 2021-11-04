class CreateExercices < ActiveRecord::Migration[6.1]
  def change
    create_table :exercices, id: :uuid do |t|
      t.string :name
      t.string :slug
      t.boolean :published
      t.references :classroom, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
