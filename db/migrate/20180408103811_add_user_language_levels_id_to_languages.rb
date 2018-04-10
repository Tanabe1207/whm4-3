class AddUserLanguageLevelsIdToLanguages < ActiveRecord::Migration[5.1]
  def change
    add_column :languages, :user_language_levels_id, :integer
  end
end
