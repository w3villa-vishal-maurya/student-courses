class AddIsAdminToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :is_admin, :boolean
  end
end
