class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :studFName
      t.string :studMName
      t.string :studLName
      t.string :studAddressCity
      t.integer :studPhone
      t.string :studGender
      t.datetime :yearOfEnroll

      t.timestamps
    end
  end
end
