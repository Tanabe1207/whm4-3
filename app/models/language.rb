class Language < ApplicationRecord

  has_many :user_language_levels
  has_many :users, through: :user_language_levels, source:'user'
  enum language:{English:0, French:1, Germany:2, Italy:3, Japanese:4, Chinese:5, Cantonese:6, Korean:7, Nederlands:8, Finnish:9, Dansk:10, Hindi:11, Others:12}
  #性別による絞込
  scope :get_by_language, ->(language){
    where(language: language)
  }
# ["English","English"],["French","French"],["Germany","Germany"],["Italy","Italy"],["Japanese","Japanese"],["Chinese","Chinese"],["Korean","Korean"]
end
