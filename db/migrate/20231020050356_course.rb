class Course < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :course_name, :string
    add_column :courses, :course_code, :integer
    add_column :courses, :content_id, :integer
  end
end
