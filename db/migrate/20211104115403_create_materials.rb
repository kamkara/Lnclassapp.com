class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials, id: :uuid do |t|
      t.string :title
      t.string :slug
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
