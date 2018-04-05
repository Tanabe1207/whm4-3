class Language < ApplicationRecord

  has_many :user_language_levels
  has_many :users, through: :user_language_levels, source:'user'

end
