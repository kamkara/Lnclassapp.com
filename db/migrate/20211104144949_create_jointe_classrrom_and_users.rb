class CreateJointeClassrromAndUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :classrooms, :users, column_options: { null: false, type: :uuid}
    create_join_table :classrooms, :exercices, column_options: { null: false, type: :uuid}
    
  end
end
