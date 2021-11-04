class CreateClassroomAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :classroom_admins, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :classroom, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
