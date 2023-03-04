class Category < ApplicationRecord
  has_many :diaries, through: :diary_categories
  has_many :diary_categories
end
