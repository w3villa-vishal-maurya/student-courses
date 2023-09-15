class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.integer :student_id
      t.integer :course_id

      t.timestamps
    end
  end
end
