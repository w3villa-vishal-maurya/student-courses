class CreateLectures < ActiveRecord::Migration[7.0]
  def change
    create_table :lectures do |t|
      t.string :lecture_title
      t.text :lecture_description
      t.integer :lecture_duration
      t.text :lecture_notes
      t.integer :content_id

      t.timestamps
    end
  end
end
