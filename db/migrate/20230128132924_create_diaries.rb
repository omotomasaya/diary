class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.date :calendar_date, null: false

      t.timestamps
    end
  end
end
