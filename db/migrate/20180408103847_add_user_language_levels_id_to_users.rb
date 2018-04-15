class AddUserLanguageLevelsIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_language_levels_id, :integer
  end
end
