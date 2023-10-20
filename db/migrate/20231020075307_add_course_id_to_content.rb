class AddCourseIdToContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :course_id, :integer
  end
end
