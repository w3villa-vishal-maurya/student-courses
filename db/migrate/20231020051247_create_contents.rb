class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :content_title
      t.text :content_description
      t.integer :lecture_id

      t.timestamps
    end
  end
end
