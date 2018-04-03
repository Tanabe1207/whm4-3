# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Language.create language: "English"
Language.create language: "Chinese"
Language.create language: "Japanese"
Language.create language: "Spanish"
Language.create language: "Italian"
Language.create language: "Germany"
Language.create language: "Hindi"
Language.create language: "Arabic"

user = User.new nickname: "Hashi Hiroki", mail: "test@mail.com", password:"test"


l = [UserLanguageLevel.new(user:user, language:Language.first, level:5), UserLanguageLevel.new(user: user, language:Language.last, level:3)]
user.user_language_levels = l

#debugger

user.save
