class CreateUserLanguageLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :user_language_levels do |t|

        t.references :user, index:true, foreign_key:true
        t.references :language, index:true, foreign_key:true
        t.integer :level, null:false

      t.timestamps
    end
  end
end
