class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.text :information
      t.string :title
      t.text :content
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :students_length

      t.timestamps
    end
  end
end
