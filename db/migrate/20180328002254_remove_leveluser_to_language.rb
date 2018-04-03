class RemoveLeveluserToLanguage < ActiveRecord::Migration[5.1]
  def change
    remove_column :languages, :level, :string
    remove_column :languages, :user_id, :integer
  end
end
