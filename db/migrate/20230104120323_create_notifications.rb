class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime
      t.timestamps
    end
  end
end
