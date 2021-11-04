class CreateClassrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :classrooms, id: :uuid do |t|
      t.string :name
      t.string :slug
      t.references :level, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
