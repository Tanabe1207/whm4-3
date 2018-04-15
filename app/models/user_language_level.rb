class UserLanguageLevel < ApplicationRecord

  belongs_to :user
  belongs_to :language

  enum level:{"全く話せない":1, "片言でなら":2, "日常会話OK":3, "ビジネスで使ってる":4, "ネイティヴ":5}

end
