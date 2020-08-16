class AddFieldsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :approve, :boolean, default: false
    add_reference :courses, :teacher, index: true
  end
end
