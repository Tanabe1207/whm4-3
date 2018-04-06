class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|

      t.integer :user_id#消えてる
      t.string :language
      t.integer :level#消えてる

      t.timestamps
    end
  end
end
