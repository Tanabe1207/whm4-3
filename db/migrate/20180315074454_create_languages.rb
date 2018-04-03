class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|

      t.integer :user_id
      t.string :language
      t.integer :level

      t.timestamps
    end
  end
end
