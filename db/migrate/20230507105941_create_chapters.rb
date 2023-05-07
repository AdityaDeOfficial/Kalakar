class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.string :chapter_title
      t.integer :chapter_number
      t.references :manga, null: false, foreign_key: true

      t.timestamps
    end
  end
end
