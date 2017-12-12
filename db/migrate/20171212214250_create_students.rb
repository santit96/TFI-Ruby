class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :lastname
      t.integer :dni
      t.string :number, limit: 25
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
