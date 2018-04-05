class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|

      t.integer :user_id #removed
      t.string :language
      t.integer :level #removed

      t.timestamps
    end
  end
end
