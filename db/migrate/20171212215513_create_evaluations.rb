class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.string :name , null: false
      t.date :date , null: false
      t.float :min_grade , null: false
      t.references :course, foreign_key: true , null: false

      t.timestamps
    end
  end
end
