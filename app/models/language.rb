class Language < ApplicationRecord

  has_many :user_language_levels
  has_many :users, through: :user_language_levels, source:'user'
  enum gender:{men:0, women:1}
  #性別による絞込
  scope :get_by_gender, ->(gender){
    where(gender: gender)
  }
end
