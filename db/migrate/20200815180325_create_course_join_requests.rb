class CreateCourseJoinRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :course_join_requests do |t|
      t.integer :student_id, index: true
      t.integer :course_id, index: true
      t.datetime :request_time
      t.boolean :approve
      t.timestamps
    end
  end
end
