class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :year
      t.string :name, limit: 100

      t.timestamps
    end
  end
end
