class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :year , null: false
      t.string :name, limit: 100 , null: false

      t.timestamps
    end
  end
end
