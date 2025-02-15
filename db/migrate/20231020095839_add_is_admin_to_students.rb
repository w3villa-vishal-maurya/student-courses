class AddIsAdminToStudents < ActiveRecord::Migration[7.0]
  def change
    unless column_exists? :students, :is_admin
      add_column :students, :is_admin, :boolean
    end
  end

  # unless column_exists? :statuses, :hold_reason
  #   add_column :statuses, :hold_reason, :string
  # end
end

