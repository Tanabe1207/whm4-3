class User < ApplicationRecord
  has_secure_password
  mount_uploader :my_image, MyImageUploader

  validates :nickname, presence: true#, uniqueness: true
  #ユーザー名による絞込
  scope :get_by_nickname, ->(nickname){
    where("nickname like ?", "%#{nickname}%")
  }

  validates :mail, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }#, uniqueness: true
  #validates :my_image, presence: true
  enum gender:{men:0, women:1}
  #性別による絞込
  scope :get_by_gender, ->(gender){
    where(gender: gender)
  }

  enum nationality:{others:0, Japan:1, Korea:2, Taiwan:3, HongKong:4, China:5,Australia:6,NewZealand:7,France:8,German:9,Nederland:10,Canada:11}

  scope :get_by_nationality, ->(nationality){
    where(nationality: nationality)
  }
  #validates :birthday, presence: true
  #validates :nationality, presence: true
  # has_many :languages
  # has_many :level, through: :user_language_levels source: 'language'#, foreign_key: 'user_id'
  # accepts_nested_attributes_for :user_language_levels, allow_destroy: true, reject_if: :all_blank
  has_many :offers, dependent: :destroy

  has_many :favorites
  has_many :favorite_offers, through: :favorites, source: 'offer'

  has_many :user_language_levels
  # has_many :languages, through: :user_language_levels, source:'language'

  has_many :comments
  has_many :comment_offers, through: :comments, source:'offer'

end

# t.string :nickname
# t.string :mail
# t.string :my_image
# t.string :gender
# t.date :birthday
# t.integer :age
# t.string :nationality
# t.string :offers
# t.string :favorites

# "Japan"
# "Korea"
# "Taiwan"
# "HongKong"
# "China"
# "Australia"
# "NewZealand"
# "France"
# "German"
# "Nederland"
# "Canada"
