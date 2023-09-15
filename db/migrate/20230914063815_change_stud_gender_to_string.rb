class ChangeStudGenderToString < ActiveRecord::Migration[7.0]
  def change
    change_column :Students, :studGender, :string
  end
end
