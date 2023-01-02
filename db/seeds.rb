# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

AdminUser.find_or_create_by!(
  email: "admin@example.com",
  last_name: "山田",
  first_name: "太郎",
  last_kana_name: "ヤマダ",
  first_kana_name: "タロウ"
) do |user|
  user.password = "password1"
  user.password_confirmation = "password1"
end
