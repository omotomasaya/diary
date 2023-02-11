class CreateDiaryCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :diary_categories do |t|
      t.references :diary, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
