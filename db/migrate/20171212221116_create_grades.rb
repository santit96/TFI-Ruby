class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.references :student, foreign_key: true , null: false
      t.references :evaluation, foreign_key: true , null: false
      t.string :grade , null: false , default: "Absent"

      t.timestamps
    end
  end
end
