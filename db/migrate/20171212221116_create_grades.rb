class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.references :student, foreign_key: true
      t.references :evaluation, foreign_key: true
      t.float :grade

      t.timestamps
    end
  end
end
