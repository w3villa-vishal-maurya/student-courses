class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :courseTitle
      t.integer :courseDuration
      t.integer :courseModule
      t.string :courseDescription
      t.integer :coursePrice

      t.timestamps
    end
  end
end
