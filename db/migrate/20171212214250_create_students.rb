class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name , null: false
      t.string :lastname , null: false
      t.integer :dni , null: false
      t.string :number, limit: 25 , null: false
      t.references :course, foreign_key: true , null: false

      t.timestamps
    end
  end
end
